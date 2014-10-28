class SubscriptionsController < ApplicationController

  respond_to :json, :html

  def new
    @categories = Blog::Category.all
    @subscription = Subscription.new
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def create
    @subscription = Subscription.find_or_initialize_by email: params[:subscription][:email]
    subscription_params.each do |key, cat|
      if cat[:_destroy] == '0'
        @subscription.categories << Blog::Category.find(cat[:id])
      end
    end
    if @subscription.save
      respond_with @subscription, status: :updated
    else
      respond_with @subscription.errors, status: :unprocessable_entity
    end
  end

  private
  def subscription_params
    params.require(:subscription).require(:category_attributes).permit!
  end

end