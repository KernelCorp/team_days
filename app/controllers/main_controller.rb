class MainController < ApplicationController
  include Subdomainable
  def index
    @item = MainFacade.new request.location.try(:city), get_partner
  end

end
