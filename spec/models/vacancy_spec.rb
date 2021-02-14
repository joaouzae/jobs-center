require 'rails_helper'

describe Vacancy do
  context 'validation' do
    it 'attributes cannot be blank' do
      # user = User.create!(email: 'joao@email.com', password: '123456')
      vacancy = Vacancy.new

      expect(vacancy.valid?).to eq false
      expect(vacancy.errors.count).to eq 7
    end

    it 'error messages are in portuguese' do
      # user = User.create!(email: 'joao@email.com', password: '123456')
      vacancy = Vacancy.new

      vacancy.valid?

      expect(vacancy.errors[:title]).to include('não pode ficar em branco')
      expect(vacancy.errors[:description]).to include('não pode ficar em branco')
      expect(vacancy.errors[:salary_range]).to include('não pode ficar em '\
                                                          'branco')
      expect(vacancy.errors[:level]).to include('não pode ficar em'\
                                                            ' branco')
      expect(vacancy.errors[:requirements]).to include('não pode ficar em'\
                                                            ' branco')
      expect(vacancy.errors[:requirements]).to include('não pode ficar em'\
                                                            ' branco')
      expect(vacancy.errors[:expiration_date]).to include('não pode ficar em '\
                                                            'branco')
      expect(vacancy.errors[:quantity]).to include('não pode ficar em '\
                                                            'branco')
    end

  end
end    
