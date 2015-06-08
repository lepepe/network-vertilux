class HostTypesController < ApplicationController
  before_action :set_host_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  def index
    @host_types = HostType.all
  end

  def show
  end

  def new
    @host_type = HostType.new
  end

  def edit
  end

  def create
    @host_type = HostType.new(host_type_params)

    respond_to do |format|
      if @host_type.save
        format.html { redirect_to @host_type, notice: 'Host type was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @host_type.update(host_type_params)
        format.html { redirect_to @host_type, notice: 'Host type was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @host_type.destroy
    respond_to do |format|
      format.html { redirect_to host_types_url, notice: 'Host type was successfully destroyed.' }
    end
  end

  private
    def set_host_type
      @host_type = HostType.find(params[:id])
    end

    def host_type_params
      params.require(:host_type).permit(:name, :icon, :description, fields_attributes: [:id, :name, :required, :field_type, :_destroy])
    end
end
