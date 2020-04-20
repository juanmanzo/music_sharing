class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def new
  end
  
  def create
    @albumname = params[:alb][:album]
    redirect_to new_user_selectors_path(user_id: current_user.id, album: @albumname)
  end
end