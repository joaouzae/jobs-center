class Vacancy < ApplicationRecord
  belongs_to :employee
  
  validates :title, :description, :salary_bottom, :salary_top, :level, :requirements,
            :expiration_date, :quantity, presence: true

end
