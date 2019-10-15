class CreateFixpoints < ActiveRecord::Migration[5.2]
  def change
    create_table :fixpoints do |t|
      t.boolean :fixed
      t.date :creation_date
      t.date :fix_date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
