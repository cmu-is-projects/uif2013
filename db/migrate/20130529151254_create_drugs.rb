class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.boolean :otc
      t.boolean :active
      t.string :description

      t.timestamps
    end
  end
end
