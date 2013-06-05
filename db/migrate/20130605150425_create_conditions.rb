class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :warning_text
      t.boolean :active

      t.timestamps
    end
  end
end
