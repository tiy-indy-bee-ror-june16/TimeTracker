class AddClientEmailToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :client_email, :string
  end
end
