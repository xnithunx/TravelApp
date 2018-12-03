class AddFavoriteTotalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favoritor_total, :text
  end
end
