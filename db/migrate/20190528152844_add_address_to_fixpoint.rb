class AddAddressToFixpoint < ActiveRecord::Migration[5.2]
  def change
    add_column :fixpoints, :address, :string
  end
end
