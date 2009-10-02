@import <Foundation/CPObject.j>
// TODO: CouchDB incorrectly serves files with a + in the path. Should file a bug.
@import "CPDictionary-ParamUtils.j"

// Spec from jquery.couch.js
//
// GET     info: /
// GET     activeTasks:options /_active_tasks
// GET     allDbs:options /_all_dbs
// GET|PUT config:options,section,option,value /_config/:section/?option=value
// POST    replicate:source,target,options /_replicate BODY:{source:target, target:target}
// db:name
//    POST     compact:options /:db/_compact
//    PUT      create:options /:db/?options
//    DELETE   drop:options /:db/?options
//    GET      info:options /:db/?options
//    GET      allDocs:options /:db/_all_docs?options
//             allDesignDocs:options allDocs({startkey:"_design", endkey:"_design0"}, options)
//             allApps:options // complex
//    GET      openDoc:docId,options,ajaxOptions /:db/:docId?options
//    POST|PUT saveDoc:doc,options /:db/:docIdIfExisting?options BODY:doc.toJSON Set doc.id, doc.rev
//    DELETE   removeDoc:doc,options /:db/:docId?rev=doc.rev
//    POST     query: // complex
//    GET      view:name,options /:db/_design/name[0]/_view/name[1]?options Name is thing/subThing

@implementation CouchDB : CPObject
{
    JSObject options           @accessors;
    CPString database          @accessors;
    CPString data              @accessors;
    // TODO: username/password for auth
}

- (id)init
{
    if (![super init])
        return nil;

    [self setDatabase:nil];
    [self setOptions:{}];
    [self setData:""];

    return self;
}

+ (id)couchWithDatabase:(CPString)theDatabase
{
    var couch = [[self alloc] init];
    [couch setDatabase:theDatabase];
    return couch;
}

+ (id)requestWithMethod:(CPString)method
                   path:(CPString)path
                options:(JSObject)options
             bodyObject:(CPDictionary)bodyObject
{
    var couch = [[self alloc] init];
    [couch setOptions:options];
    // TODO: Sort out when options should be set between calling from class or instance
    var request = [CPURLRequest requestWithURL:path];
    [request setHTTPMethod:method];
    [request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
    [request setValue:"application/json" forHTTPHeaderField:"Content-Type"] ;

    if (bodyObject)
        [request setHTTPBody:[CPString JSONFromObject:bodyObject]];

    var connection  = [CPURLConnection connectionWithRequest:request
                                                    delegate:couch];
    return couch;
}

/**
   Returns a query string preceeded by a "?", or a blank string if empty.
   @params theOptions A Javascript hash of options to pass to CouchDB.
*/
+ (CPString)encodeOptions:(JSObject)theOptions
{
    var optionsDict = [CPDictionary dictionaryWithJSObject:theOptions];
    [optionsDict removeObjectsForKeys:[CPArray arrayWithObjects:["success", "error"] count:2]];

    // TODO: Convert key, startkey, endkey values toJSON before encodeURIComponent
    var jsonKeys = ["key", "startkey", "endkey"],
        key = nil,
        keyEnumerator = [jsonKeys objectEnumerator];

    while (key = [keyEnumerator nextObject])
    {
        var value = [optionsDict objectForKey:key];
        if (value)
            [optionsDict setObject:[CPString JSONFromObject:value] forKey:key];
    }

    var queryString = [optionsDict toQueryString];
    return queryString.length ? "?" + queryString : "";
}

// GET     info: /
+ (id)info:(JSObject)options
{
    return [self requestWithMethod:"GET" path:"/" options:options bodyObject:nil];
}

// GET     activeTasks:options /_active_tasks
+ (void)activeTasks:(JSObject)options
{
    return [self requestWithMethod:"GET" path:"/_active_tasks" options:options bodyObject:nil];
}

// GET     allDbs:options /_all_dbs
+ (void)allDbs:(JSObject)options
{
    return [self requestWithMethod:"GET" path:"/_all_dbs" options:options bodyObject:nil];
}


// GET|PUT config:options,section,option,value /_config/:section/?option=value
// TODO: Unimplemented
+ (void)config:(JSObject)options section:(CPString)section option:(CPString)option
{
    // TODO: Querystring and conditionals on section as in jquery.couch.js
    var path = "/_config" + [self encodeOptions:options];
    return [self requestWithMethod:"GET" path:"/_config" + encodeURIComponent(section) + "/" options:options bodyObject:nil];
}
+ (void)config:(JSObject)options section:(CPString)section option:(CPString)option value:(CPString)value
{
    return [self requestWithMethod:"PUT" path:"/_config" + section options:options bodyObject:nil];
}

// POST    replicate:source,target,options /_replicate BODY:{source:target, target:target}
+ (void)replicateSource:(CPString)source target:(CPString)target options:(JSObject)options
{
    var replicationOptions = {source:source, target:target};
    return [self requestWithMethod:"POST" path:"/_replicate" options:options bodyObject:replicationOptions];
}

// db:name
//    POST     compact:options /:db/_compact
- (void)compact:(JSObject)theOptions
{
    var path = "/" + database + "/_compact";
    return [[self class] requestWithMethod:"POST"
                                      path:path
                                   options:theOptions
                                bodyObject:nil];
}

//    PUT      create:options /:db/?options
- (void)create:(JSObject)theOptions
{
    var path = "/" + database + "/" + [[self class] encodeOptions:theOptions];
    return [[self class] requestWithMethod:"PUT"
                                      path:path
                                   options:theOptions
                                bodyObject:nil];
}


//    DELETE   drop:options /:db/?options
- (void)drop:(JSObject)theOptions
{
    var path = "/" + database + "/" + [[self class] encodeOptions:theOptions];
    return [[self class] requestWithMethod:"DELETE"
                                      path:path
                                   options:theOptions
                                bodyObject:nil];
}

//    GET      info:options /:db/?options
- (void)info:(JSObject)theOptions
{
    var path = "/" + database + "/" + [[self class] encodeOptions:theOptions];
    return [[self class] requestWithMethod:"GET"
                                      path:path
                                   options:theOptions
                                bodyObject:nil];
}

//    GET      allDocs:options /:db/_all_docs?options
- (void)allDocs:(JSObject)theOptions
{
    var path = "/" + database + "/_all_docs" + [[self class] encodeOptions:theOptions];
    return [[self class] requestWithMethod:"GET"
                                      path:path
                                   options:theOptions
                                bodyObject:nil];
}

//             allDesignDocs:options allDocs({startkey:"_design", endkey:"_design0"}, options)
- (void)allDesignDocs:(JSObject)theOptions
{
    theOptions["startkey"] = "_design";
    theOptions["endkey"]   = "_design0";
    return [self allDocs:theOptions];
}

// TODO:             allApps:options // complex

//    GET      openDoc:docId,options,ajaxOptions /:db/:docId?options
- (void)openDoc:(CPString)theDocId options:(JSObject)theOptions
{
    var path = "/" + database + "/" + theDocId + [[self class] encodeOptions:theOptions];
    return [[self class] requestWithMethod:"GET"
                                      path:path
                                   options:theOptions
                                bodyObject:nil];
}

//    POST|PUT saveDoc:doc,options /:db/:docIdIfExisting?options BODY:doc.toJSON Set doc.id, doc.rev in return
- (void)saveDoc:(JSObject)theDoc options:(JSObject)theOptions
{
    var path = "/" + database;
    var method = "POST";
    if (theDoc._id)
    {
        path += "/" + theDoc._id;
        method = "PUT";
    }
    path += [[self class] encodeOptions:theOptions];

    if (theOptions.success)
    {
        // Wrap success callback to set id and rev in original document.
        // NOTE: Is there a concurrency issue here? It's setting values on an external object.
        var successCallback = theOptions.success;
        theOptions.success = function(doc) {
            theDoc._id = doc.id;
            theDoc._rev = doc.rev;
            successCallback(doc);
        }
    }

    return [[self class] requestWithMethod:method
                                      path:path
                                   options:theOptions
                                bodyObject:theDoc];
}

// TODO:    DELETE   removeDoc:doc,options /:db/:docId?rev=doc.rev

// TODO:    POST     query: // complex

//    GET      view:name,options /:db/_design/name[0]/_view/name[1]?options Name is thing/subThing
- (void)view:(CPString)theViewName options:(JSObject)theOptions
{
    // TODO: Document options available
    //       startkey : [userId,{}],
    //       endkey : [userId],
    //       group :true,
    //       descending : true,
    //       limit : 80,

    theViewName = theViewName.split("/");
    var path = "/" + [database, "_design", theViewName[0], "_view", theViewName[1]].join("/") +
        [[self class] encodeOptions:theOptions];

    return [[self class] requestWithMethod:"GET"
                                      path:path
                                   options:theOptions
                                bodyObject:nil];
}


- (void)connection:(CPURLConnection)connection didReceiveData:(CPString)theData
{
    data = [data stringByAppendingString:theData];
}

- (void)connection:(CPURLConnection)connection didFailWithError:(CPString)error
{
    if (options.error)
        options.error(error);
}

// Other delegate methods
// - (void)connection:(CPURLConnection)connection didReceiveResponse:(CPHTTPURLResponse)response;
// - (void)connectionDidReceiveAuthenticationChallenge:(id)connection


- (void)connectionDidFinishLoading:(CPURLConnection)aConnection
{
    try
    {
        // console.log(data);
        var responseObject = [data objectFromJSON];
        if (options.success)
            options.success(responseObject);
    }
    catch (anException)
    {
        [self connection:aConnection didFailWithError:"JSON response was blank."];
    }
}

@end

