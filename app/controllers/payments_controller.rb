class PaymentsController < ApplicationController
  before_action :authenticate_partner!, except: [:new]

  load_and_authorize_resource through: :current_partner,  except: [:new]

  respond_to :json

  def index
    @payments = @payments.search(params[:q]).result.paginate(per_page: 10, page: params[:page])
    respond_with @payments, serializer: PaginationSerializer
  end

  def new

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
