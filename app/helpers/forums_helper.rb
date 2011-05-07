module ForumsHelper

  def nested_forums_for(forum, partial = 'forums/nested_forums/list')
    render :partial => partial, :collection => forum.nested_forums
  end

  def topics_for(forum, partial = 'topics/list')
    render :partial => partial, :collection => forum.topics
  end

end
