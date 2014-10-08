class AvailableService
  include Mongoid::Document

  field :is_active, type: Boolean, default: true
  field :banned,    type: Boolean, default: false
  field :price,     type: Float

  belongs_to :service
  embedded_in :partner, class_name: 'User::Partner'

  delegate :name, :description, to: :service

  validates_presence_of :service
  validates_uniqueness_of :service

  def price
    attributes['price'] || service.price
  end

  def original_price
    service.price
  end
end
