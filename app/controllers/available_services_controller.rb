class AvailableServicesController < ApplicationController
  before_action :authenticate_partner!

  load_and_authorize_resource through: :current_partner

  respond_to :json

  def index
    respond_with @available_services
  end

  def show
    respond_with @available_service
  end

  def update
    if @available_service.update(available_service_params)
      respond_with @available_service, status: :updated
    else
      respond_with @available_service.errors, status: :unprocessable_entity
    end
  end

  private
    def available_service_params
      params.require(:available_service).permit(:is_active, :price)
    end


end
