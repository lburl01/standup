class SessionsController < ApplicationController
  def create
    @auth = env["omniauth.auth"]
    if User.exists?(email: @auth.info.email)
      true
    else
      @user = User.from_omniauth(@auth)
      session[:user_id] = @user.id
    end
    redirect_to bulbs_index_path
  end
end
