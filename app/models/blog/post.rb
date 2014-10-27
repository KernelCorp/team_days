module Blog
  class Post
    include Mongoid::Document
    include ActsAsPage

    belongs_to :category, class_name: 'Blog::Category'
    has_and_belongs_to_many :tags, class_name: 'Blog::Tag'

  end
end