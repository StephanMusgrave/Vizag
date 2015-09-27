class Listing < ActiveRecord::Base
  has_many :image_containers
  accepts_nested_attributes_for :image_containers, allow_destroy: true

  if Rails.env.development?
    has_attached_file :image,
      :styles => { :medium => "200x",
      :thumb => "100x100>" },
      :default_url => "default.jpg"
  else
    has_attached_file :image,
      :styles => { :medium => "200x",
      :thumb => "100x100>" },
      :default_url => "default.jpg",
      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
    end

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name_english, presence: true
  validates :weight, numericality: { greater_than: 0}
  # validates :price_euro, :price_dollar, :price_gbp, numericality: { greater_than: 0}

  validates_attachment_presence :image

  def at_least_one_picture
    unless image_containers.any?
      errors[:base] << 'You must add at least one image'
    end
  end

  def main_pic
    image_containers.any? ? image_containers.first.picture : 'no image'
  end

end
