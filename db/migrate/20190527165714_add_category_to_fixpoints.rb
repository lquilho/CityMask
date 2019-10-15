class AddCategoryToFixpoints < ActiveRecord::Migration[5.2]
  def change
    add_column :fixpoints, :category, :integer
  end
end
