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

    var scrollView = [[CPScrollView alloc] initWithFrame:[contentView frame]];
    [scrollView setHasHorizontalScroller:NO];
    [scrollView setAutohidesScrollers:YES];
    [scrollView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
    [contentView addSubview:scrollView];

    collectionView = [[TFCollectionView alloc] initWithItemPrototypeClass:[TFCustomCell class]
                                                               parentView:contentView
                                                                 delegate:self];
    [scrollView setDocumentView:collectionView];

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
                [self addResultWithText:"Database: Drop"
                             detailText:"Drop the cappuccino-couchdb-test database, if it exists."
                                   pass:YES];

                [couchdb create:{
                    success:function(doc) { [self runCouchDemo]; }
                    }];
            },
                error:function(doc) {
                [self addResultWithText:"Database:Drop"
                             detailText:"Couldn't drop the database: " + doc.reason
                                   pass:NO];
                [couchdb create:{ success:function(doc) { [self runCouchDemo]; } }];
            }
        }];
}

- (void)runCouchDemo
{
    [self addResultWithText:"Database: Create"
                 detailText:"Create the cappuccino-couchdb-test database"
                       pass:YES];

    [self runClassMethods];
    [self runInstanceMethods];
}

- (void)runClassMethods
{
    [CouchDB info:{
        success: function(doc) {
                [self addResultWithText:"Server: Info"
                             detailText:"Running CouchDB server version " + doc.version
                                   pass:YES];
            }
        }];

    [CouchDB activeTasks:{
        success: function(doc) {
                [self addResultWithText:"Server: Active Tasks"
                             detailText:"Number of active tasks: " + doc.length
                                   pass:YES];
            }
        }];

    [CouchDB allDbs:{
        success: function(doc) {
                [self addResultWithText:"Server: All Databases"
                             detailText:"Number of databases on this server: " + doc.length
                                   pass:YES];
            }
        }];

    var mirror = [CouchDB couchWithDatabase:"cappuccino-couchdb-test-mirror"];
    [mirror create:{
        success:function(doc)
            {
                [CouchDB replicateSource:"cappuccino-couchdb-test" target:"cappuccino-couchdb-test-mirror" options:{
                    success:function(doc)
                        {
                            [self addResultWithText:"Server: Replicate"
                                         detailText:"Replicated the database."
                                               pass:YES];
                            [mirror drop:{}];
                        }
                    }];
            },
                error:function(doc)
            {
                [self addResultWithText:"Server: Replicate"
                             detailText:"Could prepare for replication: " + doc.reason
                                   pass:NO];
                [mirror drop:{}];
            }
        }];
}

- (void)runInstanceMethods
{
    [couchdb info:{
        success: function(doc) {
                [self addResultWithText:"Database: Info"
                             detailText:"Info about " + doc.db_name + ": Disk Size " + doc.disk_size
                                   pass:YES];
            }
        }];

    var myDoc = {title:"Chunky Bacon", meaningOfLife:42};
    [couchdb saveDoc:myDoc options:{
        success: function(doc) {
                [self addResultWithText:"Database: Save Document"
                             detailText:"Saved new document with id " + myDoc._id + ", rev " + myDoc._rev
                                   pass:YES];
            }
        }];

    [couchdb allDocs:{limit: 5,
                success: function(doc) {
                [self addResultWithText:"Database: All Documents"
                             detailText:"Total documents: " + doc.total_rows
                                   pass:YES];
            }
        }];


    // NOTE: Compacting the database seems to confuse other concurrent demos.
    //     [couchdb compact:{
    //         success: function(doc) {
    //                 var result = {text:"Database: Compact",
    //                               detailText:"Compacted: " + doc.ok,
    //                               pass:YES};
    //                 [self addResult:result];
    //             }
    //         }];

}

- (void)addResultWithText:(CPString)theText detailText:(CPString)theDetailText pass:(BOOL)shouldPass
{
    var result = {text:theText,
                  detailText:theDetailText,
                  pass:shouldPass};
    [results addObject:result];
    [collectionView reloadContent];
}

- (void)collectionViewDidChangeSelection:(CPCollectionView)collectionView
{
    var currentObject = [collectionView getCurrentObject];
    // TODO: Do something with selection
}

@end
