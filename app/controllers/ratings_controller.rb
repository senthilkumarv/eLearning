
class RatingsController < ApplicationController
  respond_to :json
  include TopicsHelper
  def rate
    user = User.find_by_name(params[:userName])
    topic = Topic.find(params[:topicId])
    val = params[:ratingValue]
    comment = params[:comment]
    data = nil
    current = rating_for_topic(topic) 
    begin
      r = Rating.new
      r.user = user
      r.topic = topic
      r.value = val
      r.comment = comment
      r.save
      data = { :status => 200, :data => { :current => current }}
    rescue => err
      data = { :status => 500, :data => { :current => current, :message => err.message }}
    end
    respond_to do |format|
      format.json {render :json => data}
    end
  end

  def index
    data = nil
    begin
      ratings = Rating.all
      data = { :status => 200, :data => ratings }
    rescue
      data = { :status => 500, :data => Array.new }
    end
    respond_with(data)
  end
  
  def create
    str = params[:rating]
    print "Param: #{str}"
    r = Rating.new(params[:rating])
    r.save
    data = { :status => 200, :data => "Done" }
    respond_to do |format|
      format.json  { render :json => data }
    end
  end

end
