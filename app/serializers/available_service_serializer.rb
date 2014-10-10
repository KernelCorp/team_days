class AvailableServiceSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :name, :description, :is_active, :price, :banned, :original_price
end
