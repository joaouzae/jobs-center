class Vacancy < ApplicationRecord
  belongs_to :employee
  
  validates :title, :description, :salary_range, :level, :requirements,
            :expiration_date, :quantity, presence: true

end
