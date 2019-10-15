class SetDefaultFixedInFixpoints < ActiveRecord::Migration[5.2]
  def change
    change_column :fixpoints, :fixed, :boolean, default: false
  end
end
