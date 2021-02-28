class Company < ApplicationRecord
  # has_many :employees

  has_many :employees
  has_many :vacancies, through: :employees

  validates :name, :cnpj, presence: true, uniqueness: true
  validates :site, uniqueness: true

  def has_any_employees?
    #sempre vai ter pelo menos um funcionário that belongs_to company, então este método é inútil.
    #não tem o atributo employees.
    self.employees.count > 0
  end
end