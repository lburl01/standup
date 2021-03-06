class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @auth = env["omniauth.auth"]
    if User.exists?(email: @auth.info.email)
      user = User.find_by_email(@auth.info.email)
      session[:user_id] = user.id
    else
      @user = User.from_omniauth(@auth)
      session[:user_id] = @user.id
    end
    redirect_to bulbs_index_path
  end
end

# auth_client.code = auth_code
# auth_client.fetch_access_token!
