require "spec_helper"

describe Commit do
  let(:struct) { OpenStruct.new({
    :author_avatar_url => "avatar_url",
    :author_login      => "login",
    :author_email      => "email",
    :message           => "[#12345678] Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.",
    :date              => "date"
  }) }

  subject { @commit = Commit.build(struct) }

  its(:message) { should == "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor ..." }
  its(:story_id) { should == "12345678" }
  its(:date) { should == "date" }
  its(:merge?) { should == false }

  describe "#author" do
    subject { @commit = Commit.build(struct).author }

    its(:login) { should == "login" }
    its(:email) { should == "email" }
    its(:avatar_url) { should == "avatar_url" }
  end
  
  describe ".merge_message?" do
    it "should be true for merge pull request" do
      Commit.merge_message?("Merge pull request #1111 from rocket-science/blah-blah-blah").should be_true
    end

    it "should be true for merge remote-tracking" do
      Commit.merge_message?("Merge remote-tracking branch 'rocket-science/blah-blah-blah'").should be_true
    end

    it "should be false for the rest" do
      Commit.merge_message?("Merge stuff on object").should be_false
    end
  end

  it "should build merge commit" do
    Commit.stub(:merge_message? => true)
    MergeCommit.should_receive(:new)
    Commit.factory(struct)
  end

  it "should build normal commit" do
    Commit.stub(:merge_message? => true)
    Commit.should_receive(:new)
    Commit.factory(struct)
  end
end
