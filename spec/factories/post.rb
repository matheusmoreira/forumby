Factory.define :post do |f|

  f.topic { |post| post.association :topic }
  f.sequence(:content) { |n| "Test Post ##{n}" }

end
