
class CreateStudentConditions < ActiveRecord::Migration
  def change
    create_table :student_conditions do |t|
      t.integer :student_id
      t.integer :condition_id

      t.timestamps
    end
  end
end
