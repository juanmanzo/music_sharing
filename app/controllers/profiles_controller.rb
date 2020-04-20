require 'rspotify'
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
    RSpotify.authenticate(Rails.application.secrets.sp_client_id, Rails.application.secrets.sp_client_secret)
    @album = RSpotify::Album.find(params[:songsid])
  end
  
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find( params[:user_id] )
    @albumname = params[:albname]
    @imgurl = params[:imgurl]
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    @profile.update_attributes(:album => @albumname , :imageurl => @imgurl)
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:comments, :firstsong, :secondsong, :thirdsong)
  end
end