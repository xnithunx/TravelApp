class AddFavoritableTotalToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :favoritable_total, :text
  end
end
