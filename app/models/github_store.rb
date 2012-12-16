require "github_api"

class GithubStore
  attr_accessor :commits

  def self.load from = "production", to = "master"
    self.new(from, to).commits
  end

  def initialize(from, to)
    @commits = get_commits(from, to)
  end

  def self.github
    @github ||= Github.new :login => CONFIG["git"]["login"], :password => CONFIG["git"]["password"]
  end

  private

  def build_struct raw_commit
    OpenStruct.new({
      :author_avatar_url => raw_commit["author"]["avatar_url"],
      :author_login      => raw_commit["commit"]["committer"]["name"],
      :author_email      => raw_commit["commit"]["committer"]["email"],
      :message           => raw_commit["commit"]["message"],
      :date              => raw_commit["commit"]["committer"]["date"]
    })
  end

  def get_commits(from, to)
    GithubStore.github.repos.commits.compare(CONFIG["git"]["repo_user"], CONFIG["git"]["repo_name"], from, to)["commits"].map { |c| build_struct(c) }
  end
end
