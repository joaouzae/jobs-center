require 'rails_helper'

describe Vacancy do
  context 'validation' do
    it 'attributes cannot be blank' do
      employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
      # employee.company
      # company = Company.create!(name: 'Empresa tal', address: 'Rua tal',
      #                   cnpj: '123456789',site: 'www.empresatal.com.br',
      #                   domain: 'campuscode.com.br')
      print employee
      vacancy = Vacancy.new(employee: employee)

      expect(vacancy.valid?).to eq false
      expect(vacancy.errors.count).to eq 8
    end

    it 'error messages are in portuguese' do
      employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
      vacancy = Vacancy.new(employee: employee)

      vacancy.valid?

      expect(vacancy.errors[:title]).to include('não pode ficar em branco')
      expect(vacancy.errors[:description]).to include('não pode ficar em branco')
      expect(vacancy.errors[:salary_bottom]).to include('não pode ficar em '\
                                                       'branco')
      expect(vacancy.errors[:salary_top]).to include('não pode ficar em '\
                                                       'branco')
      expect(vacancy.errors[:level]).to include('não pode ficar em'\
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
