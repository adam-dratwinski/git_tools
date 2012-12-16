class Commit 
  attr_accessor :message, :story_id, :date, :author, :children

  ID_PATTERN = /\[#(\d{8,10})\]/

  def initialize *args
    @message  = get_message_from_message(args[0])
    @story_id = get_id_from_message(args[0])
    @date     = args[2]
    @author   = args[3]
    @children = []
  end

  def self.build struct
    author = Author.new(struct.author_login, struct.author_email, struct.author_avatar_url)
    self.new(struct.message, nil, struct.date, author)
  end

  def self.factory(struct)
    if Commit.merge_message? struct.message
      MergeCommit.build(struct)
    else
      Commit.build(struct)
    end
  end

  def merge?
    false
  end

  def self.merge_message? message
    ! ((message.to_s =~ /Merge (pull request|remote-tracking)/) == nil)
  end

  private

  def get_id_from_message(message)
    message.to_s.match(ID_PATTERN) ? message.to_s.match(ID_PATTERN)[1] : ""
  end

  def get_message_from_message(message)
    message = message.to_s.gsub(ID_PATTERN, "").strip
    message[0,80] + (message.length > 80 ? "..." : "")
  end
end
