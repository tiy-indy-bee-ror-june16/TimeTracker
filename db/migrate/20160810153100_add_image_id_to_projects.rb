class AddImageIdToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :image_id, :string
  end
end
