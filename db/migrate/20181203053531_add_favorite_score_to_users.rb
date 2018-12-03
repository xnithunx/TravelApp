class AddFavoriteScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favoritor_score, :text
  end
end
