require "spec_helper"

describe Commit do
  it "should have a message" do
    commit = Commit.new :message => "Lorem ipsum"
    commit.message.should == "Lorem ipsum"
  end

  it "should have a story id" do
    commit = Commit.new :story_id => 1
    commit.story_id.should == 1
  end
end
