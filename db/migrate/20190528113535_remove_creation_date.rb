class RemoveCreationDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :fixpoints, :creation_date
  end
end
