require 'rails_helper'

feature 'employee registers a vacancy' do
  scenario 'from index page' do
    user = User.create!(email: 'joao@email.com', password: '123456')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'
    
    expect(page).to have_link('Cadastrar uma Vaga', 
                              href: new_vacancy_path)
  end

  scenario 'successfully' do
    user = User.create!(email: 'joao@email.com', password: '123456')

    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'
    click_on 'Cadastrar uma Vaga'

    fill_in 'Título', with: 'Desenvolvedor Ios'
    fill_in 'Descrição', with: 'Contratamos desenvolvedor Ios'
    fill_in 'Entre', with: '2500.00'
    fill_in 'e', with: '3000.00'
    select "Júnior", :from => "Nível"
    fill_in 'Pré-requisitos', with: 'Desenvolvimento e sustentação para aplicativos mobile.'
    fill_in 'Data Limite para se Candidatar', with: '13/02/2031'
    fill_in 'Número de Vagas', with: 10
    click_on 'Criar Vaga'

    vaga = Vacancy.last
    expect(current_path).to eq(vacancy_path(vaga))
    expect(page).to have_content(vacancy.title)
    expect(page).to have_content(vacancy.description)
    expect(page).to have_content(vacancy.salary_range)
    expect(page).to have_content(vacancy.level)
    expect(page).to have_content(vacancy.requirements)
    expect(page).to have_content('13/02/2031')
    expect(page).to have_content(vacancy.quantity)
    expect(page).to have_link('Voltar')
  end

end