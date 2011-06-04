class CategoriesController < ApplicationController
  def new
  end
 
  def index
    data = nil
    begin
      categories = Category.all
      data = Array.new
      categories.each do |c|
        cat = {:id => c.id, :name => c.name, :description => c.description}
        data << cat
      end
      data = { :status => 200, :data => data}
    rescue
      data = { :status => 500, :data => Array.new}
    end
    respond_to do |format|
      format.json  { render :json => data }
    end
  end

end

