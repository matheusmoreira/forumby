module CategoriesHelper

  def forums_in(category, partial = 'categories/forums/list')
    render :partial => partial, :collection => category.forums
  end

end
