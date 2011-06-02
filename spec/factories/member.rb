Factory.define :member do |f|

  f.sequence(:name) { |n| "test_member_#{n}" }
  f.email { |member| "#{member.name}@forumby.net" }
  f.password 'test member'
  f.password_confirmation { |member| member.password }
  f.confirmed_at { Time.now }

end

Factory.define :moderator, :parent => :member do |f|

  f.moderator true

end

Factory.define :administrator, :parent => :member do |f|

  f.administrator true

end

Factory.define :banned_member, :parent => :member do |f|

  f.banned true

end

Factory.define :banned_moderator, :parent => :moderator do |f|

  f.banned true

end

Factory.define :banned_administrator, :parent => :administrator do |f|

  f.banned true

end
