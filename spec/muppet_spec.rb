require 'spec_helper'

class User
  include Virtus
  include Muppet

  attribute :name, String
  attribute :age, Integer
  attribute :birthday, DateTime
end

describe Muppet do

  describe "#configuration" do

    it "should be configurable" do
      lambda do
        Muppet.configure {{
          host: "localhost",
          port: 27017,
          database: "test" 
        }}
        Muppet.config.should be_a(Hash)
        Muppet.config[:host].should eql("localhost")
      end.should_not raise_error
    end

    it "should by default point to localhost:27017" do
      lambda do
        Muppet.config[:host].should eql("localhost")
        Muppet.config[:port].should eql(27017)
      end
    end

  end

  describe "#connection" do

    it "should connect to mongodb" do
      pending
      lambda do
        Muppet.connect!      
      end.should_not raise_error
    end

  end

  describe "#inserting" do

    it "should insert values to database" do
      pending
      lambda do
        user = User.new(name: "Jakub", age: 27 )
        user.save.should be_true
      end.should change(User, :count)
    end

  end

  describe "#quering" do

    it "should query all documents from collection" do
      pending
      User.find_one.should be_a(User)
    end

    it "should query first document from collection" do
      pending
      User.find.should be_a(Array)
    end

  end
  
  describe "#destroy" do

    it "should destroy document" do
      pending
      lambda do
        User.find_one.destroy
      end.should change(User, :count).by(-1)
    end

  end

end

#Connection.new("localhost", 27017, :pool_size => 5, :timeout => 5)


