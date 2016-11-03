class AuthConstraint
  def matches?(request)
    request.session[:user_id].present?
  end
end

Rails.application.routes.draw do

  constraints(AuthConstraint.new) do
    root to: 'bulbs#index'
  end

  get 'sessions/create'

  get 'users/home'
  post 'users/home' => 'bulbs#create'
  patch 'users/home' => 'bulbs#increment'

  get 'users/create'

  get 'bulbs/index'
  post 'bulbs/index' => 'bulbs#comment'

  get 'bulbs/create'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', :to => 'users#failure'

  root to: 'pages#index'

end
