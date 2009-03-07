require File.dirname(__FILE__) + '/spec_helper'

describe RGSearch::Search do
	
	before(:each) do
		RGSearch.key = 'ABQIAAAA8AEfrp2kWp9QoDYfq067fhSMXiYpZHpy0_1o1XweffEdHvFrNRQX-ZbG9IXDXY2r7l3te4RKb5mvlQ'		
	end
	
	it "should has an error when trying to search without appid" do
		RGSearch.key = nil
		lambda { RGSearch::Search.web("java") }.should raise_error
	end
	
	it "should has an error when trying to search with invalid start" do
		lambda { RGSearch::Search.web("java", :start => -1) }.should raise_error
	end
	
	it "should has an error when trying to search with invalid result size param" do
		lambda { RGSearch::Search.web("java", :rsz => "big") }.should raise_error
	end

	context 'without proxy' do
	
		setup do
			RGSearch.proxy_host = nil
			RGSearch.proxy_port = nil
		end
	
		it "should make web search" do
			resultset = RGSearch::Search.web('github', :hl => 'pt-BR', :rsz => 'small')		
			resultset.responseStatus.should eql(200)
		end
		
		it "should make images search" do
			resultset = RGSearch::Search.images('flower', :hl => 'pt-BR', :rsz => 'small')		
			resultset.responseStatus.should eql(200)
		end
		
		it "should make news search" do
			resultset = RGSearch::Search.news('obama', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
		it "should make blogs search" do
			resultset = RGSearch::Search.blogs('ruby', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
		it "should make videos search" do
			resultset = RGSearch::Search.videos('fast and furious', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
		it "should make books search" do
			resultset = RGSearch::Search.books('ruby pragmatic guide', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end	
		
		it "should make locals search" do
			resultset = RGSearch::Search.local('av. paulista, são paulo, sp, br', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
	end

	context 'with proxy' do
		
		setup do
			RGSearch.proxy_host = 'proxy.foo.intranet'
			RGSearch.proxy_port = '1234'
			
			# comment this line when test real proxys
			RGSearch.should_receive(:proxy_host).and_return(nil)
		end
		
		it "should make web search" do
			resultset = RGSearch::Search.web('github', :hl => 'pt-BR', :rsz => 'small')		
			resultset.responseStatus.should eql(200)
		end
		
		it "should make images search" do
			resultset = RGSearch::Search.images('flower', :hl => 'pt-BR', :rsz => 'small')		
			resultset.responseStatus.should eql(200)
		end
		
		it "should make news search" do
			resultset = RGSearch::Search.news('obama', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
		it "should make blogs search" do
			resultset = RGSearch::Search.blogs('ruby', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
		it "should make videos search" do
			resultset = RGSearch::Search.videos('fast and furious', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
		it "should make books search" do
			resultset = RGSearch::Search.books('ruby pragmatic guide', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end	
		
		it "should make locals search" do
			resultset = RGSearch::Search.local('av. paulista, são paulo, sp, br', :hl => 'pt-BR', :rsz => 'small')
			resultset.responseStatus.should eql(200)
		end
		
	end
	
end
