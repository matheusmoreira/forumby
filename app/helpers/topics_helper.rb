module TopicsHelper

  def posts_for(topic, partial = 'topics/posts/list')
    render :partial => partial, :collection => topic.posts
  end

  def author_information_for(topic_post, partial = 'topics/posts/member')
    render :partial => partial, :object => topic_post.member
  end

end
