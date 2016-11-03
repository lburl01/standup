class UsersController < ApplicationController
  def home
    @users_bulbs = User.bulbs_per_user
  end

  def create
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
