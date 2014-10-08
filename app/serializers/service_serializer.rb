class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
end
