module CategoriesHelper

  def forums_in(category)
    render :partial => 'forums/forum', :collection => category.forums
  end

end
