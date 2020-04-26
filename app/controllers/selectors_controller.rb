require 'rspotify'
class SelectorsController < ApplicationController
    before_action :authenticate_user!
    def new
        RSpotify.authenticate(ENV["sp_client_id"], ENV["sp_client_secret"])
        @album = RSpotify::Album.search(params[:album])
    end
    
    
    def create
        @songid = params[:songid]
        redirect_to new_user_profiles_path(user_id: current_user.id, songsid: @songid)
    end
end