class MainFacade
  attr_accessor :partner, :services, :city

  def initialize(city = nil, partner = nil, services = nil)
    @partner  = partner
    @city     = city
    @services = services
  end
end