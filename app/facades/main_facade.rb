class MainFacade
  attr_accessor :partner, :services, :city

  def initialize(city = nil, partner = nil)
    @partner  = partner
    @city     = city
  end

  def services
    if @partner.nil?
      Service.all
    else
      partner.available_services.active
    end
  end
end