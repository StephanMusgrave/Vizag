class AddHasManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_manager, :boolean
  end
end
