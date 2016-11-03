class BulbsController < ApplicationController
  # respond_to :html, :json

  def index
    @bulbs = Bulb.all
    render json: @bulbs
  end

  def create
  end
end
