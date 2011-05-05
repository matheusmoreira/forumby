Factory.define :post do |f|

  f.association :topic
  f.sequence(:content) { |n| "Test Post ##{n}" }

end
