require "spec_helper" 

describe GithubStore do
  before { stub_github_response }

  describe ".load" do
    subject { GithubStore.load[0] }

    its(:author_login) { should == "Adam Dratwinski" }
    its(:author_email) { should == "arboooz@gmail.com" }
    its(:message)      { should == "Test commit" }
    its(:date)         { should == "2012-12-14T14:50:57Z" }
    its(:author_avatar_url) { should == "https://secure.gravatar.com/avatar/9ba35aae3d928b49da8b54181f82976a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" }
  end
end
