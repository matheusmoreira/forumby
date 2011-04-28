require 'form_helper'

module CategoriesHelper

  include FormHelper

  def forums_in(category)
    render :partial => 'forums/forum', :collection => category.forums
  end

end
