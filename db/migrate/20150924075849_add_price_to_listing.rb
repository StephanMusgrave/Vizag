class AddPriceToListing < ActiveRecord::Migration
  def change
    add_column :listings, :price_euro, :integer
    add_column :listings, :price_dollar, :integer
    add_column :listings, :price_gbp, :integer
  end
end
