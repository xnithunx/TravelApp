class Plans < ActiveRecord::Migration[5.2]
  def change

    create_table :plans do |t|
  t.string :country
  t.string :city
  t.text :description
  t.date :datetime

  t.timestamps
end

  end
end
