class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.integer :drug_id
      t.string :name
      t.boolean :otc
      t.string :active
      t.string :boolean

      t.timestamps
    end
  end
end
