class BulbsController < ApplicationController

  def index
    data = []

    Bulb.all.each do |bulbs|
      bulb_id = bulbs.id
      bulb_owner = bulbs.user.name
      bulb_created = bulbs.created_at
      bright_bulb = bulbs.bright
      dim_bulb = bulbs.dim
      blocked = bulbs.blocked
      likes = bulbs.likes
      panic_score = bulbs.panic_score
      comments = bulbs.user.comments

      data << { "bulb_id" => bulb_id, "bulb created" => bulb_created, "bulb writer" => bulb_owner, "bright" => bright_bulb, "dim" => dim_bulb, "blocked" => blocked, "likes" => likes, "panic_score" => panic_score, "comment data" => comments}
    end

    render json: data
  end

  def create
  end
end
