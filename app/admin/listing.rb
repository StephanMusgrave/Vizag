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
    column("ID"){ |product| link_to product.id, admin_product_path(product) }

    column("Name") do |product|
      raw("#{product.name_english}<br><br>#{product.name_spanish}")
    end
    column("Description") do |product|
      raw("#{product.description_english} <br><br> #{product.description_spanish}")
    end
    column("Size") do |product|
      raw("#{product.size_english} <br><br> #{product.size_spanish}")
    end
    column :weight
    column("Price") do |product|
      raw("€#{product.price_euro} <br><br> $#{product.price_dollar}<br><br> £#{product.price_gbp}")
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
