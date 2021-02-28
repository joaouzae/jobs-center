class AddFieldsToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :name, :string
    add_column :applicants, :cpf, :string
    add_column :applicants, :phone, :string
    add_column :applicants, :bio, :text
  end
end
