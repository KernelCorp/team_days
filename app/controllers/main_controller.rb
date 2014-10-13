class MainController < ApplicationController
  def index
    @item = MainFacade.new request.location.try(:city), nil, Service.all
  end

  def show
    city = City.find_by domain: request.subdomain
    @item = MainFacade.new request.location.try(:city), city.partner, city.partner.services
  end
end
