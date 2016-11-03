class BulbsController < ApplicationController

  def index
    comment_info = {}
    bulb_data = {}
    
    Bulb.all.each do |bulbs|
      bulb_owner = bulbs.user.name
      bright_bulb = bulbs.bright
      dim_bulb = bulbs.dim
      blocked = bulbs.blocked
      likes = bulbs.likes
      panic_score = bulbs.panic_score
      bulb_data[bulbs.id] = { "bulb writer" => bulb_owner, "bright" => bright_bulb, "dim" => dim_bulb, "blocked" => blocked, "likes" => likes, "panic_score" => panic_score, "comments" => comment_info[bulbs.id] = bulbs.comments}
    end

    render json: bulb_data
  end

  def create
  end
end
