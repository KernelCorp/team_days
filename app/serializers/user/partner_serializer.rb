class User::PartnerSerializer < ActiveModel::Serializer
  attributes :id, :email

  def id
    object.id.to_s
  end
end