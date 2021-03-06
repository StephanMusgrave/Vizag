class ImageContainer < ActiveRecord::Base
  belongs_to :listing

  if Rails.env.development?
    has_attached_file :picture,
      :styles => { :medium => "200x",
      :thumb => "100x100>" },
      :default_url => "default.jpg"
  else
    has_attached_file :picture,
      :styles => { :medium => "200x",
      :thumb => "100x100>" },
      :default_url => "default.jpg",
      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
    end

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
