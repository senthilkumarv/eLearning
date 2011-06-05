module TopicsHelper
  def topic_to_json(topic)
    dt = topic.created_at.strftime("%d %b %Y %H:%M")
    
    {:topicId => topic.id, :topicTitle => topic.title, :posterUrl => topic.poster, :uploadTime => dt, :hits => topic.hitcount, :ratings => rating_for_topic(topic), :details => topic.detail, :url => topic.url }
  end
  def check_nil(value)
    unless value.nil? 
      value
    else
      0
    end
  end
  def rating_for_topic(topic)
    rating = check_nil(topic.ratings.average(:value))
    rating.to_f
  end
  
  def data_as_json
    data = Array.new
    status = 200
    begin
      topics = Topic.all
      topics.each do |t|
        
        data << topic_to_json(t)
      end
    rescue
      status = 400
    end
    {:status => status, :data => data}
  end
end
