class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.text :description
      t.string :salary_range
      t.string :level
      t.text :requirements
      t.date :expiration_date
      t.integer :quantity

      t.timestamps
    end
  end
end
