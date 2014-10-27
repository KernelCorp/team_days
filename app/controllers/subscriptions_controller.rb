class SubscriptionsController < ApplicationController

  respond_to :json, :html

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.find_or_initialize_by email: params[:subscription][:email]
    if @subscription.update subscription_params
      respond_with @subscription, status: :updated
    else
      respond_with @subscription.errors, status: :unprocessable_entity
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit category_ids: []
  end

end