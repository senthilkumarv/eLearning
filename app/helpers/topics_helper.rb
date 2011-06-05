module TopicsHelper
  def rating_for_topic(topic)
    topic.ratings.average(:value)
  end
  def data_as_json
    data = Array.new
    status = 200
    begin
      topics = Topic.all
      topics.each do |t| 
        top = {:topicId => t.id, :topicTitle => t.title, :posterUrl => t.poster, :uploadTime => t.created_at, :hits => t.hitcount, :ratings => rating_for_topic(t) }
        data << top
      end
    rescue
      status = 400
    end
    {:status => status, :data => data}
  end
end
