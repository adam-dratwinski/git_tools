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

  describe ".grouped_commits" do
    before do 
      # todo replace with factories
      @commit_id_1 = stub(:commit_1, :merge? => false, :story_id => 1)
      @commit_id_2 = stub(:commit_2, :merge? => false, :story_id => 2)
      @merge_commit_id_1 = stub(:merge_commit_1, :merge? => true, :story_id => 1, :children => [])

      subject.commits << @commit_id_1
      subject.commits << @commit_id_2
      subject.commits << @merge_commit_id_1
    end

    it "should return grouped commits" do
      subject.grouped_commits.should =~ [@commit_id_2, @merge_commit_id_1]
    end

    it "should have merge commit with 1 children" do
      subject.grouped_commits
      @merge_commit_id_1.children.should == [@commit_id_1]
    end
  end
end
