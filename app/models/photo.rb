class Photo
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :attach_image
  validates_attachment_content_type :attach_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  embedded_in :photo_report


end
