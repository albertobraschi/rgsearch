require "rubygems"
require "uri"
require "open-uri"
require "active_support"

Dir["#{File.dirname(__FILE__)}/rgsearch/*.rb"].sort.each { |lib| require lib }

module RGSearch
	
	API_VERSION = "1.0"
	API_URL = "http://ajax.googleapis.com/ajax/services/search"
		
	attr_accessor :key
	module_function :key, :key=	

end