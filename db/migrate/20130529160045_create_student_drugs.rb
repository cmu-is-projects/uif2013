class CreateStudentDrugs < ActiveRecord::Migration
  def change
    create_table :student_drugs do |t|
      t.integer :student_id
      t.integer :drug_id
      t.integer :dosage

      t.timestamps
    end
  end
end
