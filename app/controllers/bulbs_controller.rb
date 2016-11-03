class BulbsController < ApplicationController

  def index
    bulb_data = Bulb.select("bulbs.id as bulb_id, user_id, name as username, bright, dim, blocked, likes, panic_score").joins("INNER JOIN users ON users.id = bulbs.user_id").where("is_deleted = false").all
    comment_data = Comment.select("comments.id as comment_id, comments.user_id, comment, comments.created_at as created_at").joins("INNER JOIN bulbs ON comments.bulb_id = bulbs.id").where("is_deleted = false").all
    # all_data = {}
    all_data = {
      "bulb_data" => bulb_data,
      "comment_data" => comment_data
    }
    render json: all_data
  end

  def create
  end
end
