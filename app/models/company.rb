class Company < ApplicationRecord
  has_many :employees

  validates :name, :cnpj, presence: true, uniqueness: true
  validates :site, uniqueness: true

end
