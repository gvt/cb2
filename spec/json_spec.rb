require 'spec_helper'

describe "checking the JSON conversion is correct" do
  before do
    file = File.open("public/3d/output2.json", "r")
    content = file.read
    @hash_3d = ActiveSupport::JSON.decode(content)
  end
  
  it "should be a hash" do
    p @hash_3d.class
    @hash_3d.class.should be(Hash)
  end
  
  it "should have the obj key" do
        @hash_3d.should have_key("obj")
      end
      
      describe "obj element" do
        it "obj should be an array" do
          @hash_3d["obj"].class.should be(Array)
          @hash_3d["obj"].length.should be(1)
        end
        
        it "has a hash as the first and only element of the array" do
          a = @hash_3d["obj"]
          a[0].class.should be(Hash)
        end
        
        it " has a hash with a vrt key" do
          a = @hash_3d["obj"]
          b = a[0]
          b.should have_key("vrt")
        end
        
        describe "vrt key" do
          it "should be an array" do
            a = @hash_3d["obj"]
            b = a[0]
            c = b["vrt"]
            c.class.should be(Array)
          end
          
          it "each vrt has 3 coords" do
            a = @hash_3d["obj"]
            b = a[0]
            c = b["vrt"]
            c.first.length.should be(3)
          end
          
        end
        describe "nrm key" do
          it "should be an array" do
            a = @hash_3d["obj"]
            b = a[0]
            c = b["nrm"]
            c.class.should be(Array)
          end
          
          it "each normal has 3 coords" do
            a = @hash_3d["obj"]
            b = a[0]
            c = b["nrm"]
            c.first.length.should be(3)
          end
        end
        
        describe "face key" do
          it "should be an array" do
            a = @hash_3d["obj"]
            b = a[0]
            c = b["fac"]
            c.class.should be(Array)
          end
          
          it "each normal has 3 coords" do
            a = @hash_3d["obj"]
            b = a[0]
            c = b["fac"]
            c.first.length.should be(4)
          end
        end
      end
  end