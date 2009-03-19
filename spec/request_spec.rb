require File.dirname(__FILE__) + '/spec_helper'

describe RGSearch::Request do

	setup do		
		@connection = mock("connection")
		@exception = Exception.new('Error: can\'t access this url')
	end

	context 'without proxy' do
		
		setup do
			RGSearch.proxy_host = nil
			RGSearch.proxy_port = nil
		end

		it 'should make requests'	do
			RGSearch::Request.get('http://www.google.com.br').should_not be_nil
		end
		
		it 'should make requests with parameters' do
			RGSearch::Request.get('http://www.google.com.br/search', :q => 'java').should_not be_nil
		end

		it 'should has an error when trying to access nonexistent urls' do
			@connection.should_receive(:start).with(any_args()).and_raise(@exception)
			Net::HTTP.should_receive(:Proxy).with(any_args()).and_return(@connection)
			lambda { RGSearch::Request.get('http://foo.bar.com') }.should raise_error
		end

	end

	context 'with proxy' do

		setup do
			RGSearch.proxy_host = 'proxy.foo.intranet'
			RGSearch.proxy_port = '1234'
			
			# comment this line when test real proxys
			RGSearch.should_receive(:proxy_host).and_return(nil)
		end

		it 'should make requests'	do
			RGSearch::Request.get('http://www.google.com.br').should_not be_nil
		end
		
		it 'should make requests with parameters' do
			RGSearch::Request.get('http://www.google.com.br/search', :q => 'java').should_not be_nil
		end
		
		it 'should has an error when trying to access nonexistent urls' do
			@connection.should_receive(:start).with(any_args()).and_raise(@exception)
			Net::HTTP.should_receive(:Proxy).with(any_args()).once.and_return(@connection)
			lambda { RGSearch::Request.get('http://foo.bar.com') }.should raise_error
		end

	end

end