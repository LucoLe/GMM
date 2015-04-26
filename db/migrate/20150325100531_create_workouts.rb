class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :description
      t.references :club, index: true, null: true
      t.references :member, index: true, null: true

      t.timestamps null: false
    end
    add_foreign_key :workouts, :clubs
    add_foreign_key :workouts, :members
  end
end
