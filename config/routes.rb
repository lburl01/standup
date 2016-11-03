Rails.application.routes.draw do
  get 'sessions/create'

  get 'users/home'

  get 'users/create'

  get 'bulbs/index'

  get 'bulbs/create'

  root to: 'pages#index'

  get 'auth/:provider/callback', :to => 'users#create'
  get 'auth/failure', :to => 'users#failure'

end
