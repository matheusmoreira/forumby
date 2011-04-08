Forumby::Application.routes.draw do

  devise_for :members

  root to: 'forumby#home'
end
