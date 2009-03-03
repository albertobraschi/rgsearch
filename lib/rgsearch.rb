require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

Dir["#{File.dirname(__FILE__)}/rgsearch/*.rb"].sort.each { |lib| require lib }

module RGSearch
	
	API_VERSION = '1.0'
	API_URL = 'http://ajax.googleapis.com/ajax/services/search'
		
	%w(proxy_host proxy_port proxy_user proxy_pass key).each do |att|
		attr_accessor att.to_sym
		module_function att.to_sym, "#{att}=".to_sym
  	end

end