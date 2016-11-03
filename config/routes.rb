Rails.application.routes.draw do
  get 'sessions/create'

  get 'users/home'

  get 'users/create'

  get 'bulbs/index'

  get 'bulbs/create'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', :to => 'users#failure'

  root to: 'pages#index'

end
