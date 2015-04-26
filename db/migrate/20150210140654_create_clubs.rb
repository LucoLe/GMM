class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :address
      t.integer :postal_code
      t.string :phone_number
      t.references :club_owner

      t.timestamps null: false
    end

    add_index :clubs, :club_owner_id,                unique: true
  end
end
