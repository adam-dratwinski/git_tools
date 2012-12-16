class Store < ActiveRecord::Base
  attr_accessor :commits

  def download
    GithubStore.load.each do |commit_params|
      commits << Commit.factory(commit_params)
    end
  end

  def commits
    @data ||= []
  end

  def commits_by_story_id

  end
end
