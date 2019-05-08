require 'bundler'
require 'dotenv/load'
Bundler.require
require_all "lib"
# require "require_all"
# require_rel "./lib"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
