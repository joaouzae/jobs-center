class RemoveSalaryRangeFromVacancy < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacancies, :salary_range, :string
  end
end
