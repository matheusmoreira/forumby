module ForumsHelper

  def forum_name_for(forum)
    link_with_title_to forum.name,
                       forum_path(forum),
                       forum.description,
                       :class => 'name'
  end

  def nested_forums_for(forum, partial = 'forums/nested_forums/list')
    render :partial => partial, :collection => forum.nested_forums
  end

  def topics_for(forum, partial = 'forums/topics/list')
    render :partial => partial, :collection => forum.topics
  end

end
