class ApplicationController < ActionController::Base
	layout :set_layout

  private

  def set_layout
    devise_controller? ? 'admin' : 'application'
  end
end
