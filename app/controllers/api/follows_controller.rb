class Api::FollowsController < ApplicationController

  def create
    debugger
    @follow = Follow.new(follow_params)
    if @follow.save
      render json: @follow.leader
    else
      render json: @follow.errors.full_messages, status: 422
    end
  end

  def destroy
    @follow = Follow.find_by(follow_params)
    @follow.destroy
    render json: @follow
  end

  def follow_params
    params.require(:follow).permit(:leader_id, :follower_id)
  end

end
