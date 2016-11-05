class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def home
    @users_bulbs = Bulb.select("bright, dim, blocked, likes, panic_score, created_at").where(user_id: current_user.id).where("is_deleted = false").all
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
