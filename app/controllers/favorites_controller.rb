class FavoritesController < ApplicationController
  def new
  end

  def index
    data = nil
    begin
      favorites = Favorite.all
      data = { :status => 200, :data => favorites}
    rescue
      data = { :status => 500, :data => Array.new}
    end
    respond_to do |format|
      format.json  { render :json => data }
    end
  end
end
