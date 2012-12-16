require "spec_helper"

describe Store do
  subject { Store.new }

  let(:commit_struct) { OpenStruct.new }  

  before { GithubStore.stub(:load => [commit_struct]) }

  describe ".download" do
    it "should have one commit" do
      subject.download
      subject.commits.should have(1).commit
    end

    it "should pass struct when initialize a commit" do
      Commit.should_receive(:factory).with(commit_struct)
      subject.download
    end
  end
end
