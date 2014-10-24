class Post
  include Mongoid::Document
  include ActsAsPage

  belongs_to :category
  has_and_belongs_to_many :post

end