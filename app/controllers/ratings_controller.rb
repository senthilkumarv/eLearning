
class RatingsController < ApplicationController
  respond_to :json

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
