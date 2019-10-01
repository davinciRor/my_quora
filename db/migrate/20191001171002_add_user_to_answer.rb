class AddUserToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :user_id, :integer, index: true
  end
end
