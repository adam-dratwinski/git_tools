require "spec_helper"

describe Commit do
  let(:struct) { OpenStruct.new({
    :author_avatar_url => "avatar_url",
    :author_login      => "login",
    :author_email      => "email",
    :message           => "message",
    :date              => "date"
  }) }

  subject { @commit = Commit.build(struct) }

  its(:message) { should == "message" }
  its(:story_id) { should == nil }
  its(:date) { should == "date" }

  describe ".author" do
    subject { @commit = Commit.build(struct).author }

    its(:login) { should == "login" }
    its(:email) { should == "email" }
    its(:avatar_url) { should == "avatar_url" }
  end
end
