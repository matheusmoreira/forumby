Factory.define :topic do |f|

  f.forum { |topic| topic.association :forum }
  f.sequence(:title) { |n| "Test Topic ##{n}" }

end
