class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :volunteer_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :shiftable_type
      t.integer :shiftable_id
      t.boolean :checked_in

      t.timestamps
    end
  end
end
