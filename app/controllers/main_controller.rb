class MainController < ApplicationController
  include Subdomainable
  def index
    @subdomain = get_subdomain
    @cities = City.all
    @item = MainFacade.new request.location.try(:city), get_partner
  end

  private
  def get_subdomain
    subdomain
  end

end
