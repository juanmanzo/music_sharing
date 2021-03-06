require 'rspotify'
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # GET to /users/:user_id/profile/new
  def new
    @profile = Profile.new
    RSpotify.authenticate(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
    @songsid = params[:songsid]
    @album = RSpotify::Album.find(params[:songsid])
    
  end
  
  def searchalb
    @user  = User.find(current_user.id)
  end
  
  def searchalbcreate
    @albumname = params[:alb][:album]
    redirect_to choose_album_path(user_id: current_user.id, album: @albumname)
  end
  
  def choosealb
    RSpotify.authenticate(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
    @album = RSpotify::Album.search(params[:album])
  end
  
  def choosealbcreate
    @songid = params[:songid]
    redirect_to new_user_profiles_path(user_id: current_user.id, songsid: @songid)
  end
  
  def changealb
  end
  
  def changealbcreate
    @albumname = params[:alb][:album]
    redirect_to edit_album_path(user_id: current_user.id, album: @albumname)
  end
  
  def editalbum
    RSpotify.authenticate(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
    @album = RSpotify::Album.search(params[:album])
  end
  
  def albumcreate
    @songid = params[:songid]
    redirect_to edit_user_profiles_path(user_id: current_user.id, songsid: @songid)
  end
  
  def edit
    @profile = Profile.new
    RSpotify.authenticate(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
    @songsid = params[:songsid]
    @album = RSpotify::Album.find(params[:songsid])
  end
  
  def update
    @user = User.find( params[:user_id] )
    @profile = @user.profile
    @albumname = params[:albname]
    @imgurl = params[:imgurl]
    @songsid = params[:songsid]
    @artist = params[:artist]
    @year = params[:year]
    @url = params[:url]
    @profile.update_attributes(:album => @albumname , :imageurl => @imgurl,:year => @year,:url => @url,:artist => @artist)
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to user_path( params[:user_id] )
    else
      flash[:danger] = @profile.errors.full_messages.join(", ")
      redirect_to edit_user_profiles_path(user_id: current_user.id, songsid: @songsid)
    end
  end
  
  
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find( params[:user_id] )
    @albumname = params[:albname]
    @imgurl = params[:imgurl]
    @songsid = params[:songsid]
    @artist = params[:artist]
    @year = params[:year]
    @url = params[:url]
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    @profile.update_attributes(:album => @albumname , :imageurl => @imgurl,:year => @year,:url => @url,:artist => @artist)
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path( params[:user_id] )
    else
      flash[:danger] = @profile.errors.full_messages.join(", ")
      redirect_to new_user_profiles_path(user_id: current_user.id, songsid: @songsid)
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:comments, :firstsong, :secondsong, :thirdsong)
  end
end