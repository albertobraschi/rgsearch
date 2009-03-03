require File.dirname(__FILE__) + '/spec_helper'

describe RGSearch::Search do
	
	setup do
		RGSearch.key = 'ABQIAAAA8AEfrp2kWp9QoDYfq067fhSMXiYpZHpy0_1o1XweffEdHvFrNRQX-ZbG9IXDXY2r7l3te4RKb5mvlQ'
		RGSearch.proxy_host = 'proxy.gonow.intranet'
		RGSearch.proxy_port = '3128'
	end
	
	it "web search" do
		resultset = RGSearch::Search.web('guj', :hl => 'pt-BR', :rsz => 'small')
		puts resultset.inspect
		resultset.responseStatus.should eql(200)
	end
	
	it "image search" do
		resultset = RGSearch::Search.images('flower', :hl => 'pt-BR', :rsz => 'small')
		puts resultset.inspect
		resultset.responseStatus.should eql(200)
	end
	
	it "news search" do
		resultset = RGSearch::Search.news('obama', :hl => 'pt-BR', :rsz => 'small')
		puts resultset.inspect
		resultset.responseStatus.should eql(200)
	end
	
	it "blog search" do
		resultset = RGSearch::Search.blogs('java', :hl => 'pt-BR', :rsz => 'small')
		puts resultset.inspect
		resultset.responseStatus.should eql(200)
	end
	
	it "video search" do
		resultset = RGSearch::Search.videos('fast and furious', :hl => 'pt-BR', :rsz => 'small')
		puts resultset.inspect
		resultset.responseStatus.should eql(200)
	end
	
	it "book search" do
		resultset = RGSearch::Search.books('ruby pragmatic guide', :hl => 'pt-BR', :rsz => 'small')
		puts resultset.inspect
		resultset.responseStatus.should eql(200)
	end	
	
	it "local search" do
		resultset = RGSearch::Search.local('av. paulista, são paulo, sp, br', :hl => 'pt-BR', :rsz => 'small')
		puts resultset.inspect
		resultset.responseStatus.should eql(200)
	end	
	
end
