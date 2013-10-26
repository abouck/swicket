Swicket::Application.routes.draw do

  root to: 'venues#search'

  resources :users
  resources :venues do
    resources :events do
      resources :tickets
    end
  end

  get 'signin' => 'authentications#new'
  post 'authentications' => 'authentications#create'
  delete 'authentications' => 'authentications#destroy'
  get 'search' => 'venues#search'
  post 'venues/getsearch' => 'venues#getsearch' 

end
