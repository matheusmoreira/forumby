Forumby::Application.routes.draw do

  root :to => 'forumby#home'

  devise_for :members

  resources :members, :only => [ :index, :show ]

  resources :categories

end
