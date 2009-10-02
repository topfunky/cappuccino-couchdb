CouchDB Library for Cappuccino
==============================

More information, installation instructions, etc. coming soon.

!(Demo)[/topfunky/cappuccino-couchdb/raw/master/Artwork/demo-screenshot.png]

## Running the Demo

CouchDB's built-in webserver can serve static applications which can
access the database on the same host/port within browser security
limitations.

Run a Cappuccino app under CouchDB by editing your local.ini (or
default.ini on CouchDBX). Add to the httpd_global_handlers section:

    cappuccino-couchdb = {couch_httpd_misc_handlers, handle_utils_dir_req, "/path/to/cappuccino-couchdb"}

Open [index.html](http://localhost:5984/cappuccino-couchdb/index.html)
in your browser to run the samples.

    http://localhost:5984/cappuccino-couchdb/index.html

NOTE: It's also possible to use the
[CouchApp](http://github.com/couchapp/couchapp) command line tool to
sync a Cappuccino application to CouchDB, but the size of an
application in development would be prohibitive. It's also
inconvenient to sync code to the server every time you make a
change in development.

## Usage in Your Own Project

Copy the Classes/CouchDB directory and contents to your Cappuccino app.

    @import "CouchDB/CouchDB.j"

More documentation coming soon. In the meantime, see AppController.j.

## Author

Geoffrey Grosenbach, [PeepCode Screencasts](http://peepcode.com)

## References

* [Cappuccino](http://cappuccino.org)
* [CouchDB](http://couchdb.apache.org/)
* [CouchDB Screencast at PeepCode](http://peepcode.com/products/couchdb-with-rails)

