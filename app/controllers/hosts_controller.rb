class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  def index
    if params[:search]
      @hosts = Host.search(params[:search])
    else
      @hosts = Host.all
    end
  end

  def show
  end

  def new
    @host = Host.new(host_type_id: params[:host_type_id])
  end

  def edit
  end

  def create
    @host = Host.new(host_params)

    respond_to do |format|
      if @host.save
        format.html { redirect_to @host, notice: 'Host was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
    end
  end

  private
    def set_host
      @host = Host.friendly.find(params[:id])
    end

    def host_params
      params.require(:host).permit(:name, :host_type_id).tap do |fields|
        fields[:properties] = params[:host][:properties]
      end
    end
end
