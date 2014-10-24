class Category
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Orderable

  field :name
  slug :name
  orderable

  has_many :posts

end