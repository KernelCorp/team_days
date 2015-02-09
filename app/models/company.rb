class Company
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name

  has_mongoid_attached_file :logo
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :photo_reports
end
