class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name_english
      t.string :name_spanish

      t.timestamps null: false
    end
  end
end
