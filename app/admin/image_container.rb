ActiveAdmin.register ImageContainer do

  index do
    column :id
    column :listing_id
    column("") do |image_container|
      "#{image_container.listing.name_english}"
    end
    column :name
    column :picture_file_name
    column :picture_file_size
    column :picture_content_type
    column :picture_updated_at
    column :created_at
    column :updated_at
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

