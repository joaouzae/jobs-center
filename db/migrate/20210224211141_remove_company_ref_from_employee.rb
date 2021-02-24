class RemoveCompanyRefFromEmployee < ActiveRecord::Migration[6.1]
  def change
    remove_reference :employees, :company, null: false, foreign_key: true
  end
end
