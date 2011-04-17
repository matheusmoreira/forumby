class ApplicationController < ActionController::Base

  protect_from_forgery

  check_authorization :unless => :devise_controller?

  def current_ability
    @current_ability ||= MemberAbility.new(current_member)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :flash => { :error => exception.message }
  end

end
