class Plans < ActiveRecord::Migration[5.2]
  def change
     create_table :plans do |t|
      t.text :title
      t.text :address
      t.text :description
      t.string :activities
      t.string :image_url
      t.text :address
      t.float :latitude
      t.float :longitude
      t.references :user

      t.timestamps
    end


  end
end
