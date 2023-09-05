require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Pitch.destroy_all
User.destroy_all

github = [
  'WillliamRocha',
  'FilipeMariano',
  'pmoret24',
  'RobertoBarros',
  'Eduardozica',
  'Luisfelipe',
  'Suricato',
  'Alecio',
  'wesley',
  'Rennan',
  'cesar',
  'Vitin'
]

skills = [
'Ruby',
'Python',
'C++',
'Java',
'JavaScript',
'Flutter',
'Rust',
'COOBOL',
'C'

]
pitches = [
'Lago roxo',
'Edison',
'Einstein',
'Elixir',
'fomentar',
'Bola de fogo',
'Vaga-lume',
'Magenta',
'Pantera pura',
'Chave inglesa',
'Tempestade de fogo',
'Caminhão de bombeiros',
'Beta morto',
'Duas tesouras',
'Bravo alienígena',
'Autópsia',
'Martelo louco',
'Gato flamejante',
'Fusão',
'Sozinho',
'Alfa sólido',
'Gêmeos-84',
'Só jade',
'Fralda',
'HotJava',
'Índigo',
'Porta de ferro',
'Criptonita',
'Céu líquido',
'Lorax',
'Chapeleiro Maluco',
'Cachorro Louco',
'Manga',
'Mercúrio',
'Metro',
'Luz da lua',
'ostra',
'Nautilus',
'Nitro',
'Odisséia',
'Ómega',
'Orion',
'Fénix',
'Pequeno porco',
'Prelúdio',
'Tempestade verde',
'Sujeira rápida',
'Projeto X',
'Piton',
'quadro',
'Mercúrio',
'Alvoroço',
'Riviera',
'Macaco enorme',
'Romeo',
'Bandeira renascida'
]
Chatroom.create!(name: "general")
 User.create!(email: "sebastien@lewagon.org", first_name: "Sebastien", password: "123456")
 User.create!(email: "boris@lewagon.org", first_name: "Boris", password: "123456")


users = []
Pitch.destroy_all
20.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  user = User.create!({
    first_name: first,
    last_name: last,
    skills: skills,
    email: "#{first[0]}_#{last}@example.com".downcase,
    password: "123123",
    description: Faker::Company.buzzword,
    github: github
  })




  users << user
  puts user.email
end


20.times do

  pitch = Pitch.new({
    title: pitches.sample,
    languages: skills.sample(3).join(", " ),
    category: Faker::Company.suffix,
    description: Faker::Company.department,
    source: "link"
  })
  pitch.user = users.sample
  pitch.save!
  puts "Criou o pitch #{pitch.title}"

end
