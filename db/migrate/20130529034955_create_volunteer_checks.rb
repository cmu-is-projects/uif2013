class CreateVolunteerChecks < ActiveRecord::Migration
  def change
    create_table :volunteer_checks do |t|
      t.date :date_submitted
      t.date :date_completed
      t.boolean :approved
      t.string :notes
      t.integer :volunteer_id
      t.integer :check_id
      t.boolean :paid

      t.timestamps
    end
  end
end
