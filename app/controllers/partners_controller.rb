class PartnersController < ApplicationController
  before_action :authenticate_partner!

  respond_to :json, :html

  def show
    @partner = current_partner
    respond_with @partner
  end

  def update
    if current_partner.update permit_params
      head :ok
    else
      render json: current_partner.errors, status: :unprocessable_entity
    end
  end

  protected
    def permit_params
      params.require(:partner).permit :email, :password
    end
end
