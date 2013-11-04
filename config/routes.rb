Swicket::Application.routes.draw do

  root to: 'events#search'

  resources :users
  resources :events do
    resources :tickets
  end


  get 'signin' => 'authentications#new'
  post 'authentications' => 'authentications#create'
  delete 'authentications' => 'authentications#destroy'

  
  get 'search' => 'events#search'
  post 'events/getsearch' => 'events#getsearch'
  get 'active' => 'events#active' 

end
