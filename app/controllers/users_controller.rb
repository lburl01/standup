class UsersController < ApplicationController
  def home
  end

  def create
    @user = User.from_omniauth(@auth)
    @auth = env["omniauth.auth"]
    session[:user_id] = @user.id
    redirect_to bulbs_index_path
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
