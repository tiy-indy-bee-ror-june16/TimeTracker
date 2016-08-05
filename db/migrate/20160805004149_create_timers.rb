class CreateTimers < ActiveRecord::Migration[5.0]
  def change
    create_table :timers do |t|
      t.decimal :value
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
