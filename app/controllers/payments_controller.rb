class PaymentsController < ApplicationController
  include Sortable
  before_action :authenticate_partner!

  load_and_authorize_resource through: :current_partner

  respond_to :json

  def index
    @payments = @payments.order(order_option).paginate(per_page: 10, page: params[:page])
    respond_with @payments
  end

  def show
    respond_with @payment
  end

  def update
    if @payment.update(payment_params)
      respond_with @payment, status: :updated
    else
      respond_with @payment.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:sum, :status)
    end
end
