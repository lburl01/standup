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

      data << { "bulb_id" => bulb_id, "bulb_created" => bulb_created, "bulb_writer" => bulb_owner, "bright" => bright_bulb, "dim" => dim_bulb, "blocked" => blocked, "likes" => likes, "panic_score" => panic_score, "comment_data" => comments}
    end

    respond_to do |format|
      format.json { render json: data }
      format.html { render :index }
    end
  end

  def create
    @bulb = Bulb.create(
      user_id: current_user.id,
      bright: params['bright'],
      dim: params['dim'],
      blocked: params['blocked'],
      panic_score: params['panic_score']
      )
  end

  def increment
    bulb = Bulb.find(params[:id])
    bulb.increment!(:likes)
  end

  def comment
    @comment = Comment.create(
    user_id: current_user.id,
    comment: params['comment'],
    bulb_id: params['bulb_id']
    )
  end
end
