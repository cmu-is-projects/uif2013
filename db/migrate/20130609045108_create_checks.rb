class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :name
      t.integer :duration
      t.decimal :cost

      t.timestamps
    end
  end
end
