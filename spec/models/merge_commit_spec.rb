describe MergeCommit do
  it "should have a id when is leading dash" do
    struct = OpenStruct.new({
      :message => "Merge pull request #111 from rocket-scientist/remove-shoulda-40420100"
    })

    commit = MergeCommit.build(struct)
    commit.story_id.should == "40420100"
  end

  it "should have a id when is leading slash" do
    struct = OpenStruct.new({
      :message => "Merge pull request #111 from rocket-scientist/40420100-remove-shoulda"
    })

    commit = MergeCommit.build(struct)
    commit.story_id.should == "40420100"
  end

  it "should match correct id" do
    struct = OpenStruct.new({
      :message => "Merge pull request #11111111 from rocket-scientist/40420100-remove-shoulda"
    })

    commit = MergeCommit.build(struct)
    commit.story_id.should == "40420100"
  end

  it "should rewritte the message" do
    struct = OpenStruct.new({
      :message => "Merge pull request #111 from rocket-scientist/remove-shoulda-40420100"
    })

    commit = MergeCommit.build(struct)
    commit.message.should == "Merge branch rocket-scientist/remove-shoulda-40420100"
  end

  it "should be a merge" do
    MergeCommit.new.merge?.should be_true
  end
end
