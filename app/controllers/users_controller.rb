class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def home
    @users_bulbs = User.bulbs_per_user
    respond_to do |format|
      format.json { render json: @users_bulbs }
      format.html { render :home }
    end
  end

  def create
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
