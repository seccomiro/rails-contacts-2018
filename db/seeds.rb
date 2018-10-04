require 'faker'

puts "Criando 5 Tipos de Contato"
5.times do
  kind = Kind.create! description: Faker::Hacker.unique.noun.capitalize
end

puts "Criando 10 Empresas"
10.times do
  company = Company.create! name: Faker::Company.unique.name, active: Faker::Boolean.boolean
  puts "Criando #{company.name}"

  puts "Criando 10 Contatos para: #{company.name}"
  10.times do
    kind = Kind.all.sample
    contact = Contact.create! name: Faker::StarWars.character, email: Faker::Internet.unique.email, kind: kind, company: company, remark: Faker::StarWars.wookiee_sentence

    Address.create! street: Faker::Address.unique.street_address, city: Faker::Address.city, state: Faker::Address.state, contact: contact

    3.times do
      Phone.create! phone: Faker::PhoneNumber.unique.cell_phone, contact: contact
    end
  end
end