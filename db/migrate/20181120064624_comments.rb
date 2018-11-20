class Comments < ActiveRecord::Migration[5.2]
  create_table :comments do |t|
      t.text :user_comment
      t.references :user
      t.references :plan
      t.timestamps
    end
end
