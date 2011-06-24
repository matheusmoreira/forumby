module MembersHelper

  def topic_count_for(member, html_options = {})
    link_to t('members.topics.count', :count => member.topic_count), member_topics_path(member), html_options.merge(:class => 'topic-count')
  end

  def post_count_for(member, html_options = {})
    link_to t('members.posts.count', :count => member.post_count), member_posts_path(member), html_options.merge(:class => 'post-count')
  end

end
