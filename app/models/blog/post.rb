module Blog
  class Post
    include Mongoid::Document
    include ActsAsPage

    belongs_to :category, class_name: 'Blog::Category'
    has_and_belongs_to_many :tags, class_name: 'Blog::Tag'

    after_create :send_mail

    private
    def send_mail
      category = self.category
      PostsMailer.new_post(category).deliver
    end

  end
end