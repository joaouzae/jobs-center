require 'rails_helper'

feature 'Employee signs in' do
  scenario 'successfully' do
    user = User.create!(email: 'joao@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    expect(page).to have_content user.email
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).to have_link 'Sair'
    expect(page).not_to have_link 'Entrar'
  end

  scenario 'and logout' do
    user = User.create!(email: 'joao@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    click_on 'Sair'

    within('nav') do
      expect(page).not_to have_link 'Sair'
      expect(page).not_to have_content user.email
      expect(page).to have_link 'Entrar'
    end

  end
end