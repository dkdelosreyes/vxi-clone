class ApplicationController < ActionController::Base
	layout :set_layout

  private

  def set_layout
    devise_controller? ? 'admin' : 'application'
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    admin_path
  end
end
