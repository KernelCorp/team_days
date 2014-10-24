class MainController < ApplicationController
  include Subdomainable
  def index
    @subdomain = subdomain
    @cities = City.all
    @item = MainFacade.new request.location.try(:city), get_partner
  end

end
