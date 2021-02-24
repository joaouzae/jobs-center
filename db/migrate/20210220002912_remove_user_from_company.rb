class RemoveUserFromCompany < ActiveRecord::Migration[6.1]
  def change
    remove_reference :companies, :user, null: false, foreign_key: true
  end
end
