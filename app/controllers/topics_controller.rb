class TopicsController < ApplicationController
  def new
  end

  def index
    data = Array.new
   # begin
      topics = Topic.all
      topics.each do |t| 
        top = {:topicId => t.id, :topicTitle => t.title, :posterUrl => t.poster, :uploadTime => t.created_at, :hits => t.hitcount}
        data << top
      end
      data = { :status => 200, :data => data}
    #rescue
      #data = { :status => 500, :data => Array.new}
    #end
    respond_to do |format|
      format.json  { render :json => data }
    end
  end

end
