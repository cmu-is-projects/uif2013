class CreateVolunteerMeals < ActiveRecord::Migration
  def change
    create_table :volunteer_meals do |t|
      t.integer :volunteer_id
      t.integer :event_id

      t.timestamps
    end
  end
end
