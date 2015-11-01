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

  after_save    :expire_imagecontainer_all_cache
  after_destroy :expire_imagecontainer_all_cache

  def self.all_cached
    Rails.cache.fetch('ImageContainer.all') { all }
  end

  def expire_contact_all_cache
    Rails.cache.delete('ImageContainer.all')
  end

end
