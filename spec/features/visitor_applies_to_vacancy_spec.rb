require 'rails_helper'

feature 'Visitor applies to vacancy' do
  scenario 'from vacancies page' do
    #criar a vaga
    employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
    vacancy = Vacancy.create!(title: 'vaga da hora', description: 'é da hora',
                          salary_bottom: 2500.00, salary_top: 3000.00,
                          level: 'Júnior', requirements: 'asdfgfh',
                          expiration_date: '22/02/2033', quantity: 10, employee: employee)
    
    visit root_path
    click_on 'Vagas'
    # expect(page).to have_link('vaga da hora', href: [:employee, vacancy])
    expect(page).to have_link('vaga da hora', href: '/visitor/vacancies/1')


  end
  scenario 'and clicks on a vacancy' do
    employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
    vacancy = Vacancy.create!(title: 'vaga da hora', description: 'é da hora',
                              salary_bottom: 2500.00, salary_top: 3000.00,
                              level: 'Júnior', requirements: 'asdfgfh',
                              expiration_date: '22/02/2033', quantity: 10,
                              employee: employee)
    
    visit root_path
    click_on 'Vagas'
    click_on 'vaga da hora'

    expect(page).to have_content('Entrar como candidato')
    expect(page).to have_content('Entrar como funcionário')
    expect(page).to have_content(vacancy.title)
    expect(page).to have_content(vacancy.description)
    expect(page).to have_content(vacancy.salary_bottom)
    expect(page).to have_content(vacancy.salary_top)
    expect(page).to have_content(vacancy.level)
    expect(page).to have_content(vacancy.requirements)
    expect(page).to have_content('22/02/2033')
    expect(page).to have_content(vacancy.quantity)
  end
  scenario 'successfully' do
    employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
    vacancy = Vacancy.create!(title: 'vaga da hora', description: 'é da hora',
                              salary_bottom: 2500.00, salary_top: 3000.00,
                              level: 'Júnior', requirements: 'asdfgfh',
                              expiration_date: '22/02/2033', quantity: 10,
                              employee: employee)
    
    visit root_path
    click_on 'Vagas'
    click_on 'vaga da hora'
    click_on 'Candidatar'

    fill_in 
  end
end