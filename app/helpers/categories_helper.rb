module CategoriesHelper

  def forums_in(category, partial = 'forums/list')
    render :partial => partial, :collection => category.forums
  end

end
