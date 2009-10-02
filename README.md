CouchDB Library for Cappuccino
==============================

More information, installation instructions, etc. coming soon.

## Installation

Run under CouchDB by editing your local.ini (or default.ini on CouchDBX) to add to httpd_global_handlers

    cappuccino-couchdb = {couch_httpd_misc_handlers, handle_utils_dir_req, "/path/to/cappuccino-couchdb"}

Open [index.html](http://localhost:5984/cappuccino-couchdb/index.html) in your browser to run the samples.

## Usage

Copy the Classes/CouchDB directory and contents to your Cappuccino app.

    @import "CouchDB/CouchDB.j"

Documentation coming soon. In the meantime, see AppController.j.

## Author

Geoffrey Grosenbach, [PeepCode Screencasts](http://peepcode.com)

## References

* [Cappuccino](http://cappuccino.org)
* [CouchDB](http://couchdb.apache.org/)
* [CouchDB Screencast at PeepCode](http://peepcode.com/products/couchdb-with-rails)

