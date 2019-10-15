class SetDefaultFixedInFixpointAttachments < ActiveRecord::Migration[5.2]
  def change
    change_column :fixpoint_attachments, :fixed, :boolean, default: false
  end
end
