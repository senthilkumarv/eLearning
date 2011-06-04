class RatingsController < ApplicationController
  def new
  end

  def index
    data = nil
    begin
      ratings = Rating.all
      data = { :status => 200, :data => ratings}
    rescue
      data = { :status => 500, :data => Array.new}
    end
    respond_to do |format|
      format.json  { render :json => data }
    end
  end

end
