Factory.define :post do |f|

  f.member { |post| post.association :member }
  f.topic { |post| post.association :topic }
  f.sequence(:content) { |n| "Test Post ##{n}" }

end
