module CategoriesHelper
  def data_as_json
    data = Array.new
    status = 200
    begin
      categories = Category.all
      categories.each do |t| 
        cat = { :id => c.id, :name => c.name }
        data << top
      end
    rescue
      status = 400
    end
    {:status => status, :data => data}
  end
end
