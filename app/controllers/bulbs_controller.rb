
class BulbsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index

    data = []

    @all_bulbs = Bulb.all.where(is_deleted: false)

    @all_bulbs.each do |bulbs|
      bulb_id = bulbs.id
      bulb_owner = bulbs.user.name
      bulb_created = bulbs.created_at
      bright_bulb = bulbs.bright
      dim_bulb = bulbs.dim
      blocked = bulbs.blocked
      likes = bulbs.likes
      panic_score = bulbs.panic_score
      comments = bulbs.comments.where(bulb_id: bulbs.id).all

      data << { "bulb_id" => bulb_id, "bulb_created" => bulb_created, "bulb_writer" => bulb_owner, "bright" => bright_bulb, "dim" => dim_bulb, "blocked" => blocked, "likes" => likes, "panic_score" => panic_score, "comment_data" => comments}
    end

    data = data.sort_by { |bulb| bulb["bulb_created"]}.reverse

    respond_to do |format|
      format.json { render json: data }
      format.html { render :index }
    end
  end

  def create
    @bulb = Bulb.new(
      user_id: current_user.id,
      bright: params['bright'],
      dim: params['dim'],
      blocked: params['blocked'],
      panic_score: params['panic_score']
    )
    respond_to do |format|
      if @bulb.valid?
        @bulb.save
        :created
      else
        format.json { render json: @bulb.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def increment_likes
    bulb = Bulb.find(params['id'])
    bulb.increment!(:likes)
    status 200
  end

  def comment
    @comment = Comment.new(
      user_id: current_user.id,
      comment: params['comment'],
      bulb_id: params['bulb_id']
    )
    respond_to do |format|
      if @comment.valid?
        @comment.save
        :created
      else
        format.json { render json: @comment.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

  def bulb_params
    params.require(:bulb).permit(:id, :bright, :dim, :blocked, :likes, :panic_score)
  end
end
