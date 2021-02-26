class AddEmployeeRefToVacancy < ActiveRecord::Migration[6.1]
  def change
    add_reference :vacancies, :employee, null: false, foreign_key: true
  end
end
