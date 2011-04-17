Factory.define :member do |f|

  f.name 'test member'
  f.email 'test_member@forumby.net'
  f.password 'test member'
  f.password_confirmation 'test member'

end

Factory.define :administrator, :parent => :member do |f|

  f.administrator true

end

Factory.define :moderator, :parent => :member do |f|

  f.moderator true

end
