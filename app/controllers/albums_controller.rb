class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def new
    @user  = User.find(current_user.id)
  end
  
  def create
    @albumname = params[:alb][:album]
    redirect_to new_user_selectors_path(user_id: current_user.id, album: @albumname)
  end
end