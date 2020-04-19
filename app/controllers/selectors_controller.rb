require 'rspotify'
class SelectorsController < ApplicationController
    def new
        RSpotify.authenticate(Rails.application.secrets.sp_client_id, Rails.application.secrets.sp_client_secret)
        @album = RSpotify::Album.search(params[:album])
    end
    
    
    def create
        @songid = params[:songid]
        redirect_to new_user_profiles_path(user_id: current_user.id, songsid: @songid)
    end
end