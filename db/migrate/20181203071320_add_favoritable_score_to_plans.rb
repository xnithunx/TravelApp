class AddFavoritableScoreToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :favoritable_score, :text
  end
end
