require File.dirname(__FILE__) + "/spec_helper"

describe RGSearch::Request do

  before(:all) do
    @exception = Exception.new("Error: can't access this url")
    @uri = mock("uri")
    @uri.stub!(:open).with(any_args()).and_raise(@exception)
  end

  
  it "should make requests" do
    RGSearch::Request.get("http://www.google.com.br").should_not be_nil
  end
  
  it "should make requests with parameters" do
    RGSearch::Request.get("http://www.google.com.br/search", :q => "java").should_not be_nil
  end

  it "should has an error when trying to access nonexistent urls" do
    RGSearch::Request.stub!(:get_uri).with(any_args()).and_return(@uri)
    lambda { RGSearch::Request.get("http://foo.bar") }.should raise_error
  end

end
