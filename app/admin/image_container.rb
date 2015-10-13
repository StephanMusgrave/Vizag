ActiveAdmin.register ImageContainer, as: "Image" do

  index do
    column("Product ID") do |image_container|
      "#{image_container.listing.id}"
    end
    column("Image ID") do |image_container|
      "#{image_container.id}"
    end
    column("Product Name") do |image_container|
      "#{image_container.listing.name_english}"
    end
    column :picture_file_name
    column :picture_file_size
    column :picture_content_type
    column :picture_updated_at
    column :created_at
    column :updated_at
    column("image") do |image_container|
      "#{image_tag image_container.picture.url}"
    end
  end

end


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

