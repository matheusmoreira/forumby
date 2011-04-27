Factory.define :forum do |f|

  f.association :category
  f.name 'Test Forum'
  f.description 'Forum for use in testing.'

end

Factory.define :forum_without_category, :parent => :forum do |f|

  f.category nil

end
