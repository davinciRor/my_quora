class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.string :file
      t.timestamps
    end

    add_index :attachments, [:attachable_id, :attachable_type]
  end
end
