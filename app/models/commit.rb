class Commit < Struct.new :message, :story_id, :date, :author
  def self.build struct
    Commit.new(struct.message, nil, struct.date, Author.new(struct.author_login, struct.author_email, struct.author_avatar_url))
  end
end
