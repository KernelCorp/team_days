class AvailableServiceSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :name, :description, :is_active, :price, :banned, :original_price, :service_id

  def service_id
    object.service_id.to_s
  end
end
