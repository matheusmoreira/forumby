module TopicsHelper

  def posts_for(topic, partial = 'posts/list')
    render :partial => partial, :collection => topic.posts
  end

end
