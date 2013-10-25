Swicket::Application.routes.draw do

  root to: 'venues#home'

  resources :users
  resources :venues do
    resources :events do
      resources :tickets
    end
  end

  get 'signin' => 'authentications#new'
  post 'authentications' => 'authentications#create'
  delete 'authentications' => 'authentications#destroy'

  end
