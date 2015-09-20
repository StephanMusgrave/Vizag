json.array!(@listings) do |listing|
  json.extract! listing, :id, :name_english, :name_spanish, :string, :description_english, :description_spanish, :size_english, :size_spanish, :weight
  json.url listing_url(listing, format: :json)
end
