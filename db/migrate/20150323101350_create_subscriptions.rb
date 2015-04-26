class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :club
      t.references :member

      t.timestamps null: false
    end
    add_foreign_key :subscriptions, :clubs
    add_foreign_key :subscriptions, :members
    add_index :subscriptions, [ :club_id, :member_id], unique: true
  end
end
