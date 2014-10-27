class SubscriptionSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :email

end
