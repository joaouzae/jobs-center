class AddSalaryBottomAndSalaryTopToVacancy < ActiveRecord::Migration[6.1]
  def change
    add_column :vacancies, :salary_bottom, :decimal
    add_column :vacancies, :salary_top, :decimal
  end
end
