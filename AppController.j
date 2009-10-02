/*
 * AppController.j
 * cappuccino-couchdb
 *
 * Created by Geoffrey Grosenbach on October 1, 2009.
 * MIT Licensed.
 */

@import <Foundation/CPObject.j>

@import "Classes/Views/TFCollectionView/TFCollectionView.j"
@import "Classes/Views/TFCustomCell.j"
@import "Classes/CouchDB/CouchDB.j"

@implementation AppController : CPObject
{
    TFCollectionView collectionView;
    CPArray results;
    CouchDB couchdb;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    [contentView setBackgroundColor:[CPColor colorWithHexString:"eeeeee"]];

    collectionView = [[TFCollectionView alloc] initWithItemPrototypeClass:[TFCustomCell class]
                                                               parentView:contentView
                                                                 delegate:self];
    [contentView addSubview:collectionView];

    [theWindow orderFront:self];
    [self startRelaxing];
}

/**
   Create a database.
   Add some data.
   Run some demos.
*/
- (void)startRelaxing
{
    results = [CPArray array];
    [collectionView setContent:results];

    couchdb = [CouchDB couchWithDatabase:"cappuccino-couchdb-test"];
    // Drop and re-create the database
    [couchdb drop:{
        success:function(doc) {
                var result = {text:"Database: Drop",
                              detailText:"Drop the cappuccino-couchdb-test database, if it exists.",
                              pass:YES};
                [self addResult:result];

                [couchdb create:{
                    success:function(doc) { [self runCouchDemo]; }
                    }];
            }
        }];
}

- (void)runCouchDemo
{
    [self addResult:{text:"Database: Create", detailText:"Create the cappuccino-couchdb-test database", pass:YES}];

    [self runClassMethods];
    [self runInstanceMethods];
}

- (void)runClassMethods
{
    [CouchDB info:{
        success: function(doc) {
                var result = {text:"Server: Info",
                              detailText:"Running CouchDB server version " + doc.version,
                              pass:YES};
                [self addResult:result];
            }
        }];

    [CouchDB activeTasks:{
        success: function(doc) {
                var result = {text:"Server: Active Tasks",
                              detailText:"Number of active tasks: " + doc.length,
                              pass:YES};
                [self addResult:result];
            }
        }];

    [CouchDB allDbs:{
        success: function(doc) {
                var result = {text:"Server: All Databases",
                              detailText:"Number of databases on this server: " + doc.length,
                              pass:YES};
                [self addResult:result];
            }
        }];

    // TODO: Fails if the db exists. Needs to respond to errors.
    var mirror = [CouchDB couchWithDatabase:"cappuccino-couchdb-test-mirror"];
    [mirror create:{
        success:function(doc) {
                [CouchDB replicateSource:"cappuccino-couchdb-test" target:"cappuccino-couchdb-test-mirror" options:{
                    success:function(doc) {
                            var result = {text:"Server: Replicate",
                                          detailText:"Replicated the database.",
                                          pass:YES};
                            [self addResult:result];
                            [mirror drop:{}];
                        }
                    }];
            }
        }];
}

- (void)runInstanceMethods
{
    [couchdb compact:{
        success: function(doc) {
                var result = {text:"Database: Compact",
                              detailText:"Compacted: " + doc.ok,
                              pass:YES};
                [self addResult:result];
            }
        }];

    [couchdb info:{
        success: function(doc) {
                var result = {text:"Database: Info",
                              detailText:"Info about " + doc.db_name + ": Disk Size " + doc.disk_size,
                              pass:YES};
                [self addResult:result];
            }
        }];

    var myDoc = {title:"Chunky Bacon", meaningOfLife:42};
    [couchdb saveDoc:myDoc options:{
        success: function(doc) {
                var result = {text:"Database: Save Document",
                              detailText:"Saved new document with id " + myDoc._id + ", rev " + myDoc._rev,
                              pass:YES};
                [self addResult:result];
            }
        }];

}

- (void)addResult:(id)theResult
{
    [results addObject:theResult];
    [collectionView reloadContent];
}

- (void)collectionViewDidChangeSelection:(CPCollectionView)collectionView
{
    var currentObject = [collectionView getCurrentObject];
    // TODO: Do something with selection
}

@end
