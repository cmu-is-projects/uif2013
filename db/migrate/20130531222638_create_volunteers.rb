class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :barcode_number
      t.integer :household_id
      t.boolean :is_male
      t.date :date_of_birth
      t.string :cell_phone
      t.boolean :can_text
      t.string :email
      t.string :status
      t.string :avatar_file_name
      t.integer :avatar_file_size
      t.string :avatar_file_content_type
      t.datetime :avatar_updated_at
      t.date :app_submit_date
      t.boolean :app_approved
      t.string :role
      t.string :name_displayed
      t.integer :spouse_id
      t.integer :student_id

      t.timestamps
    end
  end
end
