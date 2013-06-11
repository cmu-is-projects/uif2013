class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :location_id
      t.string :category
      t.integer :min_grade
      t.integer :max_grade
      t.string :contact_person
      t.string :phone
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
