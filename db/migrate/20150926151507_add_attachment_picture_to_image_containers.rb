class AddAttachmentPictureToImageContainers < ActiveRecord::Migration
  def self.up
    change_table :image_containers do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :image_containers, :picture
  end
end
