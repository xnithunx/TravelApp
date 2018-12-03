class AddFavoritableScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favoritable_score, :text
  end
end
