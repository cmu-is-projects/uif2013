class CreateVolunteerTrainings < ActiveRecord::Migration
  def change
    create_table :volunteer_trainings do |t|
      t.integer :volunteer_id
      t.integer :training_id
      t.date :date

      t.timestamps
    end
  end
end
