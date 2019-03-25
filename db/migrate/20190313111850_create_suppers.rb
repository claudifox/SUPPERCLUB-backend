class CreateSuppers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppers do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.string :date
      t.string :time
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :user_id

      t.timestamps
    end
  end
end
