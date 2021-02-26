require 'rails_helper'

feature 'employee signs up' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastrar Funcionário'

    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end

  scenario 'and sees the company registration page' do
    visit root_path
    click_on 'Cadastrar Funcionário'

    within('form') do
      fill_in 'Email', with: 'joao@campuscode.com.br'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'
    end
    
    expect(current_path).to eq(new_company_path)
  end

  scenario 'and registers their company' do
    visit root_path
    click_on 'Cadastrar Funcionário'
    within('form') do
      fill_in 'Email', with: 'joao@campuscode.com.br'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'
    end
    within('form') do
      fill_in 'Name', with: 'Empresa tal'
      fill_in 'Address', with: 'rua tal'
      fill_in 'Cnpj', with: '123456789'
      fill_in 'Site', with: 'www.empresatal.com.br'
    end
  end
end