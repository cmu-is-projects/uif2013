class CreateDepartmentTrainings < ActiveRecord::Migration
  def change
    create_table :department_trainings do |t|
      t.integer :training_id
      t.integer :department_id

      t.timestamps
    end
  end
end
