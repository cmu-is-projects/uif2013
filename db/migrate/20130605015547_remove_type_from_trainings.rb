class RemoveTypeFromTrainings < ActiveRecord::Migration
  def up
    remove_column :trainings, :type
  end

  def down
    add_column :trainings, :type, :string
  end
end
