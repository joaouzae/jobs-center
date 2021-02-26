class Employee < ApplicationRecord
  belongs_to :company
  has_many :vacancies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  before_validation :create_company
  after_create :associate_domain_to_company

  enum role: {member: 0, admin: 5}

  private
  def create_company
    #só criar uma nova empresa se não existir nenhuma com o mesmo domínio do employee
    company = Company.find_by(domain: self.employee_domain())
    if company
      self.role = "member"
      self.company = company
    else
      self.company = Company.new
      self.company.save(:validate => false)
      self.role = "admin"
    end
  end

  def associate_domain_to_company
    unless self.company_has_domain?
      self.company.domain = self.employee_domain()
      self.company.save(:validate => false)
    end
  end

  def employee_domain
    self.email.split('@').last
  end

  def company_has_domain?
    self.company.domain
  end
end