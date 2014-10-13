class OrdersController < ApplicationController
  include Sortable
  before_action :authenticate_partner!

  load_and_authorize_resource through: :current_partner

  respond_to :json

  def index
    @orders = @orders.order(order_option).paginate(per_page: 10, page: params[:page])
    respond_with @orders, :meta => {:total_pages => @orders.total_pages, :page => (params[:page] || 1).to_i}
  end

  def show
    respond_with @order
  end

  def create
    @order = Order.new(order_public_params)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end


  def update
    if @order.update(order_private_params)
      respond_with @order, status: :updated
    else
      respond_with @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def order_private_params
      params.require(:order).permit(:cost, :status)
    end

    def order_public_params
      params.require(:order).permit()
    end
end
