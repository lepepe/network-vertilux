class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :host_types
  private

  def host_types
    @host_types = HostType.all.order("name ASC")
  end
end
