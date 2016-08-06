class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :project_id

      t.timestamps
    end
  end
end
