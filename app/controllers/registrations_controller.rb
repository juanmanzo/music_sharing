class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    search_album_path(user_id: current_user.id)
  end
end