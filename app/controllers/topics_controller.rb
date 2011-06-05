class TopicsController < ApplicationController
  include TopicsHelper

  def hit
    data = nil
    print "Inside Hit"
    begin
      t = Topic.find(params[:id])
      t.hitcount = t.hitcount + 1
      t.save
      data = {:status => 200, :data => {:hits => t.hitcount}}
      print "Hit Saved Data"
    rescue => err
      data = {:status => 500, :data => nil}
      print "Save Failed #{err.message}"
    end  
    respond_to do |format|
      format.json  { render :json => data }
    end
  end

  def index
    data = data_as_json
    respond_to do |format|
      format.json  { render :json => data, :except => [:details, :url] }
    end
  end

  def show
    topic = Topic.find(params[:id])
    data = {:status => 200, :data => topic_to_json(topic)}
    respond_to do |format|
      format.json  { render :json => data  }
    end
  end
  
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end


  
  # POST /blogs
  # POST /blogs.xml
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to(@topic, :notice => 'Topic was successfully created.') }
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end
end
