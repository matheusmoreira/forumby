Forumby::Application.routes.draw do

  root to: 'forumby#home'

  devise_for :members
end
