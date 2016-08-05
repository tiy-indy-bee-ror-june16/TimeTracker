class ChangeUseridtoOwnerid < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :user_id, :owner_id
  end
end
