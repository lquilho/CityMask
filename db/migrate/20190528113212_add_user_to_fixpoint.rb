class AddUserToFixpoint < ActiveRecord::Migration[5.2]
  def change
    add_reference :fixpoints, :user, foreign_key: true
  end
end
