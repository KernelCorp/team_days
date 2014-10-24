class Service
  include Mongoid::Document

  field :name
  field :price, type: Float
  field :description

  has_and_belongs_to_many :services_boxes

  validates_uniqueness_of :name

  def service_id; id; end
end
