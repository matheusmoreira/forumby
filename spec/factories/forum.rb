Factory.define :forum do |f|

  f.sequence(:name) { |n| "Test Forum ##{n}" }

end

Factory.define :forum_without_category, :parent => :forum do |f|

  f.category nil

end

Factory.define :forum_with_category, :parent => :forum do |f|

  f.category { |forum| forum.association :category }

end

Factory.define :forum_without_parent, :parent => :forum do |f|

  f.parent_forum nil

end

Factory.define :forum_with_parent, :parent => :forum do |f|

  f.name 'Nested Forum'
  f.parent_forum { |forum| forum.association :forum }

end

Factory.define :top_level_forum, :parent => :forum do |f|

  f.category nil
  f.parent_forum nil

end

Factory.define :forum_without_description, :parent => :forum do |f|

  f.description ''

end

Factory.define :forum_with_description, :parent => :forum do |f|

  f.description 'Forum for use in testing.'

end
