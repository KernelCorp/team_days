class AvailableServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_active, :price, :banned

  def id
    object.id.to_s
  end
end
