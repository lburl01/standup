Rails.application.routes.draw do
  get 'users/home'

  get 'users/create'

  get 'bulbs/index'

  get 'bulbs/create'

  root to: 'pages#index'

end
