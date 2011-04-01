require 'spec_helper'

describe ThreeDObjectsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should create a new variable" do
      get :new
      assigns[:object].should be_new_record
    end
  
  end

  describe "POST 'create'" do
    describe "valid params" do
      before do
        @object = Factory.build :object
        @object.fake_file!
      end
    
      it "should add a file to db" do
        lambda{
          post :create, :object => @object.attributes
        }.should change(ThreeDObject, :count).by(1)
      end
    
      it "should have a message declaring success" do
          post :create, :object => @object.attributes
          flash[:notice].should_not be_nil
      end
    end
    
    describe "invalid params" do
      before do
        @object = Factory.build :object
      end
      
      it "should not add a file to DB " do
        lambda{
          post :create, :object => @object.attributes
        }.should_not change(ThreeDObject, :count)
      end
      
      it "should have some errors " do
        post :create, :object => @object.attributes
        @object.errors.should_not be_nil
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
