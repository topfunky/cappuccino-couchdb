
require 'objective-j'
require 'objective-j/bundletask'

if !ENV['CONFIG']
    ENV['CONFIG'] = 'Debug'
end

ObjectiveJ::BundleTask.new(:cappuccinoCouchdb) do |t|
    t.name          = 'cappuccino-couchdb'
    t.identifier    = 'com.yourcompany.cappuccinoCouchdb'
    t.version       = '1.0'
    t.author        = 'Your Company'
    t.email         = 'feedback @nospam@ yourcompany.com'
    t.summary       = 'cappuccino-couchdb'
    t.sources       = FileList['*.j']
    t.resources     = FileList['Resources/*']
    t.index_file    = 'index.html'
    t.info_plist    = 'Info.plist'
    t.build_path    = File.join('Build', ENV['CONFIG'], 'cappuccinoCouchdb')
    t.flag          = '-DDEBUG' if ENV['CONFIG'] == 'Debug'
    t.flag          = '-O' if ENV['CONFIG'] == 'Release'
end

task :default => [:cappuccinoCouchdb]
