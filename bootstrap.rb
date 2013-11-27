require './bootstrap/base'
require './bootstrap/backup'
require './bootstrap/setup'

Bootstrap::Base.new(Dir.pwd).process!
