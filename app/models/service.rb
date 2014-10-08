class Service
  include Mongoid::Document

  field :name
  field :price, type: Float
  field :description
end
