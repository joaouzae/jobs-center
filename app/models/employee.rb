class Employee < ApplicationRecord
  belongs_to :company
  has_many :vacancies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  before_validation :create_company

  private
  def create_company
    self.company = Company.create!()
  end
end