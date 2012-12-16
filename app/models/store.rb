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

  def grouped_commits
    grouped_commits = commits.clone

    grouped_commits.select(&:merge?).each do |merge_commit|
      grouped_commits.reject(&:merge?).select do |commit|
        merge_commit.story_id == commit.story_id
      end.each do |commit|
        merge_commit.children << grouped_commits.delete(commit)
      end
    end
    grouped_commits
  end
end
