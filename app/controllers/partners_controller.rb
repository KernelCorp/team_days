class PartnersController < ApplicationController
  before_action :authenticate_partner!

  def show
    @partner = current_partner
  end
end
