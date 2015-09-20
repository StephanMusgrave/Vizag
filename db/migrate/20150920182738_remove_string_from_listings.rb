class RemoveStringFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :string
  end
end
