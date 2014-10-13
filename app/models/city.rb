class City
  include Mongoid::Document

  field :name
  field :domain
  field :geo_name

  has_one :partner, class_name: 'User::Partner'

  before_validation :set_geocode
  after_validation :apply_geocode
  validate :check_geocode

  private
  def set_geocode
    @geocode = Geocoder.search name
  end

  def apply_geocode
    if @geocode.count == 1
      result = @geocode.first
      self.geo_name = result.city
    end
  end

  def check_geocode
    if @geocode.count != 1
      errors.add :name, I18n.t('city_not_found')
    end
  end

end
