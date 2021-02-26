require 'rails_helper'

describe Company do
  context 'validation' do
    it 'attributes cannot be blank' do
      company = Company.new

      expect(company.valid?).to eq false
      expect(company.errors.count).to eq 2
    end

    it 'and cnpj must be unique' do
      # employee = Employee.create!(email: 'joao@campuscode.com.br', password: '123456')
      Company.create!(name: 'Empresa tal', address: 'Rua tal',
                        cnpj: '123456789',site: 'www.empresatal.com.br',
                        domain: 'campuscode.com.br')
      company = Company.new(cnpj: '123456789')

      expect(company.valid?).to eq false

      expect(company.errors[:cnpj]).to include('já está em uso')
    end
  end
end