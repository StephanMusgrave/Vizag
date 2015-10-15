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
                :category_id,
                :category_name,
                :category_name_english,
                :image_containers_attributes => [:picture, :original_filename, :content_type, :headers]

  filter :category_id,          label: "Category ID"
  filter :name_english,         label: "English name"
  filter :name_spanish,         label: "Spanish name"
  filter :description_english,  label: "English description"
  filter :description_spanish,  label: "Spanish description"
  filter :size_english,         label: "English size"
  filter :size_spanish,         label: "Spanish size"
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
    # column :category_name
    column 'Category', sortable: :category_id do |product|
      if product.category_id?
        "##{product.category.id}  #{product.category_name}"
      else
        "n/a"
      end
    end
    actions
  end

  # This is how you edit the forms for the  "Edit" and "Create" pages.
  form do |f|
    f.inputs do
      f.input :category, :as => :select, :prompt => "Category", :collection => Category.pluck(:name_english, :id)
      f.input :name_english
      f.input :name_spanish
      f.input :description_spanish
      f.input :description_english
      f.input :size_spanish
      f.input :size_english
      f.input :weight
      f.input :price_euro
      f.input :price_dollar
      f.input :price_gbp
    end
    f.actions
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
