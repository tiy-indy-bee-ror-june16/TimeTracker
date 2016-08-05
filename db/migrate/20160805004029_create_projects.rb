class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :summary
      t.decimal :estimated_time
      t.decimal :actual_time

      t.timestamps
    end
  end
end
