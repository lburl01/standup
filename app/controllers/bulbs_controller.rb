class BulbsController < ApplicationController

  def index
    # bulbs = Bulb.all
    @bulbs_usersnames = User.select("name, bright, dim, blocked, likes, bulbs.id as id").joins("INNER JOIN bulbs ON bulbs.user_id = users.id").where("is_deleted = false")
    render json: @bulbs_usersnames
  end

  def create
  end
end
