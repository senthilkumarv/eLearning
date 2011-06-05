require 'http-access2'
require 'soap/wsdlDriver'

class UsersController < ApplicationController
  def new
  end

  def index
    data = nil
    begin
      users = User.all
      data = { :status => 200, :data => users}
    rescue
      data = { :status => 500, :data => Array.new}
    end
    respond_to do |format|
      format.json  { render :json => data,:except => [:created_at, :updated_at] }
    end
  end
  
  def favorite
    fav = Favorite.new(params[:favorite])
    fav.save
    data = { :status => 200, :data => "Favorite Added Successfully"}
    respond_to do |format|
      format.json  { render :json => data }
    end
  end
end
