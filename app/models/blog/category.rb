module Blog
  class Category
    include Mongoid::Document
    include Mongoid::Slug
    include Mongoid::Orderable

    field :name
    slug :name
    orderable

    has_many :posts, class_name: 'Blog::Post'
    has_and_belongs_to_many :subscriptions

  end
end