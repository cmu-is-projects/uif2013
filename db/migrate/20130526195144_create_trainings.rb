class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :level
      t.date :next_offered

      t.timestamps
    end
  end
end
