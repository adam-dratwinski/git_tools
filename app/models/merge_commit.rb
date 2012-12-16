class MergeCommit < Commit
  ID_PATTERN = /[-\/](\d{8,10})/

  def merge?
    false
  end

  private

  def get_id_from_message(message)
    message.to_s.match(ID_PATTERN) ? message.to_s.match(ID_PATTERN)[1] : ""
  end

  def get_message_from_message(message)
    branch_name = message.split(" ").last
    message = "Merge branch #{branch_name}"
    message[0,80] + (message.length > 80 ? "..." : "")
  end
end
