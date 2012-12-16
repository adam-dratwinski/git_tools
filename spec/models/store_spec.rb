require "spec_helper"

describe Store do
  subject { Store.new }

  let(:commit_params) { { } }  

  before { GithubStore.stub(:load => [commit_params]) }

  describe ".download" do
    it "should have one commit" do
      subject.download
      subject.commits.should have(1).commit
    end

    it "should pass params when initialize a commit" do
      Commit.should_receive(:new).with(commit_params)
      subject.download
    end
  end
end
