class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name_english
      t.string :name_spanish
      t.string :string
      t.text :description_english
      t.text :description_spanish
      t.string :size_english
      t.string :size_spanish
      t.integer :weight

      t.timestamps null: false
    end
  end
end
