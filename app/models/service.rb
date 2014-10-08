class Service
  include Mongoid::Document

  field :name
  field :price, type: Float
  field :description

  validates_uniqueness_of :name
end
