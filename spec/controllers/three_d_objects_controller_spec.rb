require 'spec_helper'

describe ThreeDObjectsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post 'create'
      response.should be_success
    end
    
    it "should add a file to db" do
      
    end
    
    it "should have a message declaring success" do
      
    end
    
    describe "conversion" do
      it "should create an identical file in .js " do
        
      end
    end
  end

  pending "GET 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end

end
