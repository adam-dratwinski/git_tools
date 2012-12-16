class Commit
  attr_accessor :story_id, :message

  def initialize params = {}
    @message  = params[:message]
    @story_id = params[:story_id]
  end
end
