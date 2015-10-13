ActiveAdmin.register Listing, as: "Product" do

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

  filter :name_english, label: "English name"
  filter :name_spanish, label: "Spanish name"
  filter :description_english, label: "English description"
  filter :description_spanish, label: "Spanish description"
  filter :size_english, label: "English size"
  filter :size_spanish, label: "Spanish size"
  filter :weight
  filter :price_euro
  filter :price_dollar
  filter :price_gbp

  index do
    selectable_column
    column("ID"){ |listing| link_to listing.id, admin_listing_path(listing) }

    column("Name") do |listing|
      raw("#{listing.name_english}<br><br>#{listing.name_spanish}")
    end
    column("Description") do |listing|
      raw("#{listing.description_english} <br><br> #{listing.description_spanish}")
    end
    column("Size") do |listing|
      raw("#{listing.size_english} <br><br> #{listing.size_spanish}")
    end
    column :weight
    column("Price") do |listing|
      raw("€#{listing.price_euro} <br><br> $#{listing.price_dollar}<br><br> £#{listing.price_gbp}")
    end
    actions
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
