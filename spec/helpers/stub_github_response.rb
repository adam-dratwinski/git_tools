require 'rspec/mocks/standalone'

def stub_github_response
  example_response = [{"comments_url"=>
     "https://api.github.com/repos/adwinsky/git_tools/commits/ed9df613f1ad6fc2e853381dc6d5e687fed7b9c1/comments",
    "author"=>
     {"type"=>"User",
      "repos_url"=>"https://api.github.com/users/adwinsky/repos",
      "avatar_url"=>
       "https://secure.gravatar.com/avatar/9ba35aae3d928b49da8b54181f82976a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
      "gists_url"=>"https://api.github.com/users/adwinsky/gists{/gist_id}",
      "events_url"=>"https://api.github.com/users/adwinsky/events{/privacy}",
      "organizations_url"=>"https://api.github.com/users/adwinsky/orgs",
      "url"=>"https://api.github.com/users/adwinsky",
      "gravatar_id"=>"9ba35aae3d928b49da8b54181f82976a",
      "received_events_url"=>
       "https://api.github.com/users/adwinsky/received_events",
      "followers_url"=>"https://api.github.com/users/adwinsky/followers",
      "following_url"=>"https://api.github.com/users/adwinsky/following",
      "login"=>"adwinsky",
      "subscriptions_url"=>"https://api.github.com/users/adwinsky/subscriptions",
      "starred_url"=>
       "https://api.github.com/users/adwinsky/starred{/owner}{/repo}",
      "id"=>311951},
    "url"=>
     "https://api.github.com/repos/adwinsky/git_tools/commits/ed9df613f1ad6fc2e853381dc6d5e687fed7b9c1",
    "commit"=>
     {"url"=>
       "https://api.github.com/repos/adwinsky/git_tools/git/commits/ed9df613f1ad6fc2e853381dc6d5e687fed7b9c1",
      "author"=>
       {"email"=>"arboooz@gmail.com",
        "date"=>"2012-12-14T14:50:57Z",
        "name"=>"Adam Dratwinski"},
      "comment_count"=>0,
      "message"=>"Test commit",
      "committer"=>
       {"email"=>"arboooz@gmail.com",
        "date"=>"2012-12-14T14:50:57Z",
        "name"=>"Adam Dratwinski"},
      "tree"=>
       {"url"=>
         "https://api.github.com/repos/adwinsky/git_tools/git/trees/c12d7c0ed49ad9c7aa938743ba6fdee54b6b7fe1",
        "sha"=>"c12d7c0ed49ad9c7aa938743ba6fdee54b6b7fe1"}},
    "committer"=>
     {"type"=>"User",
      "repos_url"=>"https://api.github.com/users/adwinsky/repos",
      "avatar_url"=>
       "https://secure.gravatar.com/avatar/9ba35aae3d928b49da8b54181f82976a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
      "gists_url"=>"https://api.github.com/users/adwinsky/gists{/gist_id}",
      "events_url"=>"https://api.github.com/users/adwinsky/events{/privacy}",
      "organizations_url"=>"https://api.github.com/users/adwinsky/orgs",
      "url"=>"https://api.github.com/users/adwinsky",
      "gravatar_id"=>"9ba35aae3d928b49da8b54181f82976a",
      "received_events_url"=>
       "https://api.github.com/users/adwinsky/received_events",
      "followers_url"=>"https://api.github.com/users/adwinsky/followers",
      "following_url"=>"https://api.github.com/users/adwinsky/following",
      "login"=>"adwinsky",
      "subscriptions_url"=>"https://api.github.com/users/adwinsky/subscriptions",
      "starred_url"=>
       "https://api.github.com/users/adwinsky/starred{/owner}{/repo}",
      "id"=>311951},
    "parents"=>
     [{"url"=>
        "https://api.github.com/repos/adwinsky/git_tools/commits/b7e07ab0c9c2179e6cfa9a674cccff51c10bba38",
       "sha"=>"b7e07ab0c9c2179e6cfa9a674cccff51c10bba38"}],
    "sha"=>"ed9df613f1ad6fc2e853381dc6d5e687fed7b9c1"}]

  commits = { "commits" => example_response }
  GithubStore.stub_chain(:github, :repos, :commits, :compare).and_return(commits)
end
