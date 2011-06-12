module CategoriesHelper

  def category_name_for(category)
    link_with_title_to category.name,
                       category_path(category),
                       category.description,
                       :class => 'name'
  end

  def forums_in(category, partial = 'categories/forums/list')
    render :partial => partial, :collection => category.forums
  end

end
