class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    if current_user
      redirect_to host_types_path
    end
  end

  def dashboard
    @host_types = HostType.all.order("id ASC")
    @hosts = Host.all
  end
end
