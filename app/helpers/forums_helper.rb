require 'form_helper'

module ForumsHelper

  include FormHelper

  def nested_forums_for(forum)
    render :partial => 'forums/nested_forum', :collection => forum.nested_forums
  end

end
