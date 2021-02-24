require 'rails_helper'

feature 'Employee views all vacancies' do
  scenario 'successfully' do
    employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
    print employee
    vaga = Vacancy.create!(title: 'Desenvolvedor Ios', 
                    description: 'Contratamos desenvolvedor Ios',
                    salary_bottom: 2500.00,
                    salary_top: 3000.00,
                    level: 'Júnior',
                    requirements: 'Desenvolvimento e sustentação para aplicativos mobile.',
                    expiration_date: '13/02/2031',
                    quantity: 10,
                    employee: employee)
    
    login_as employee, scope: :user
    visit employee_vacancies_path

    expect(page).to have_content(vaga.title)
    expect(page).to have_content(vaga.description)
  end

  scenario 'and clicks on a vacancy' do
    employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
    vaga = Vacancy.create!(title: 'Desenvolvedor Ios', 
                    description: 'Contratamos desenvolvedor Ios',
                    salary_bottom: 2500.00,
                    salary_top: 3000.00,
                    level: 'Júnior',
                    requirements: 'Desenvolvimento e sustentação para aplicativos mobile.',
                    expiration_date: '13/02/2031',
                    quantity: 10,
                    employee: employee)
    
    login_as employee, scope: :user
    visit employee_vacancies_path
    click_on vaga.title

    expect(current_path).to eq(vacancy_path(vaga))
    expect(page).to have_content(vaga.title)
    expect(page).to have_content(vaga.description)
    expect(page).to have_content(vaga.salary_range)
    expect(page).to have_content(vaga.level)
    expect(page).to have_content(vaga.requirements)
    expect(page).to have_content('13/02/2031')
    expect(page).to have_content(vaga.quantity)
  end

  scenario 'and no vacancy is created' do
    # Arrange
    applicant = User.create!(email: 'joao@email.com', password: '123456')

    # Act
    login_as applicant, scope: :user
    visit vacancies_path

    # Assert
    expect(page).to have_content('Nenhuma vaga cadastrada')
  end
  
  scenario 'and returns to home page' do
    user = User.create!(email: 'joao@email.com', password: '123456')
    Vacancy.create!(title: 'Desenvolvedor Ios', 
                    description: 'Contratamos desenvolvedor Ios',
                    salary_range: 'R$2500,00 a R$3000,00',
                    level: 'Júnior',
                    requirements: 'Desenvolvimento e sustentação para aplicativos mobile.',
                    expiration_date: '13/02/2031',
                    quantity: 10
                   )

    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
  
end