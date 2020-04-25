class LikesController < ApplicationController
  before_action :find_post
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to user_path(params[:user_id])
  end
  
  private
  def find_post
    @post = Profile.find(params[:user_id])
  end
  
  def already_liked?
    Like.where(user_id: current_user.id, profile_id:
    params[:user_id]).exists?
  end
end