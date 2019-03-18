class CreateSuppers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppers do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.datetime :dateTime
      t.string :address
      t.string :latLng
      t.integer :user_id

      t.timestamps
    end
  end
end
