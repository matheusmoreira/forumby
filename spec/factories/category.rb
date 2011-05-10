Factory.define :category do |f|

  f.sequence(:name) { |n| "Test Category ##{n}" }

end

Factory.define :category_without_description, :parent => :category do |f|

  f.description ''

end

Factory.define :category_with_description, :parent => :category do |f|

  f.description 'Category for use in testing.'

end
