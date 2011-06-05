module UsersHelper
  def data_as_json(username)
    data = Array.new
    status = 200
    begin
      user = User.find_by_name(username)
      favs = user.favorites
      favs.each do |t| 
        fav = {:topicId => t.id, :topicTitle => t.title, :posterUrl => t.poster, :uploadTime => t.created_at, :hits => t.hitcount}
        data << fav
      end
    rescue
      status = 400
    end
    {:status => status, :data => data}
  end
end
