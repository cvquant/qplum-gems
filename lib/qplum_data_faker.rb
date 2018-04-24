require 'faker'
require 'active_support'

Dir[File.expand_path File.dirname(__FILE__)+'/strategies/*.rb'].each {|file| require file }


