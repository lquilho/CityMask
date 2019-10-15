class CreateFixpointAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :fixpoint_attachments do |t|
      t.string :photo
      t.references :fixpoint, foreign_key: true
      t.boolean :fixed

      t.timestamps
    end
  end
end
