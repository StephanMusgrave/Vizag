ActiveAdmin.register Listing do



  permit_params :name_english,
                :name_spanish,
                :description_english,
                :description_spanish,
                :size_english,
                :size_spanish,
                :weight,
                :image,
                :price_euro,
                :price_dollar,
                :price_gbp,
                :image_containers_attributes => [:picture, :original_filename, :content_type, :headers]

  filter :name_english_or_name_spanish
  filter :description_english_or_description_spanish
  filter :size_english_or_size_spanish
  filter :weight
  filter :price_euro
  filter :price_dollar
  filter :price_gbp

  index do
    selectable_column
    column("ID"){ |listing| link_to listing.id, admin_listing_path(listing) }

    column("English name") { |listing| listing.name_english }

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
