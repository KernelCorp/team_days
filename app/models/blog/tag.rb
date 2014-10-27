module Blog
  class Tag
    include Mongoid::Document
    include Mongoid::Slug

    field :name
    slug :name
    has_and_belongs_to_many :posts
  end
end