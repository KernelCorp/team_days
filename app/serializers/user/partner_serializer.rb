class User::PartnerSerializer < ActiveModel::Serializer
  attributes :id, :email, :city_name, :city_subdomain

  def id
    object.id.to_s
  end
end
