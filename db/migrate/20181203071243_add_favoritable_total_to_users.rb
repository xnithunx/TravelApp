class AddFavoritableTotalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favoritable_total, :text
  end
end
