class Store < ActiveRecord::Base
  attr_accessor :commits

  def download
    GithubStore.load.each do |commit_params|
      commits << Commit.new(commit_params)
    end
  end

  def commits
    @data ||= []
  end
end
