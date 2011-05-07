Forumby::Application.routes.draw do

  root :to => 'forumby#home'

  devise_for :members

  resources :members, :only => [ :index, :show ]

  resources :categories do
    resources :forums, :module => :categories, :only => [ :index, :new, :create ]
  end

  resources :forums do
    resources :nested_forums, :module => :forums, :only => [ :index, :new, :create ]
    resources :topics, :module => :forums, :only => [ :index, :new, :create ]
  end

  resources :topics, :except => [ :new, :create ] do
    resources :posts, :module => :topics, :only => [ :index, :new, :create ]
  end

  resources :posts, :except => [ :new, :create ]

end
