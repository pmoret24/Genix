require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Pitch.destroy_all
Project.destroy_all
Chatroom.destroy_all
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
  "NuvemCéuAzul",
  "RobôsAmigos",
  "AceleraInovação",
  "SoluçõesVirtuais",
  "VisãoFuturo",
  "CodeWave",
  "TechVanguarda",
  "DataMágica",
  "ConexãoDigital",
  "InovaTech",
  "PixelPerfeito",
  "QuantumLeap",
  "CyberGuardians",
  "CidadeInteligente",
  "BrainStormTech",
  "CryptoPioneiros",
  "NanoNet",
  "VidaDigital",
  "ProjetosEstelares",
  "StudioInovação",
  "FutureFusion",
  "CodeCrafters",
  "TechSapiens",
  "DigitalDreamscape",
  "DataDynamo",
  "InfiniteInnovate",
  "QuantumQuest",
  "PixelPioneers",
  "VortexVirtuoso",
  "CyberNexa",
  "SmartSync",
  "InovaSphere",
  "TechTrailblazers",
  "NanotechNirvana",
  "CosmoCode",
  "IntelliSync",
  "InovaçãoEclética",
  "TechFoguete",
  "BitBliss",
  "HoloHarmonia",
  "VidaVirtual",
  "TechnoTranse",
  "NovaOrdemDigital",
  "ProjectProton",
  "MindMatrix",
  "FuturoFluxo",
  "TechTesserato",
  "Inovação360",
  "CyberSólido",
  "NexaNeural"
]


projects = [
  "NuvemCéuAzul",
  "RobôsAmigos",
  "AceleraInovação",
  "SoluçõesVirtuais",
  "VisãoFuturo",
  "CodeWave",
  "TechVanguarda",
  "DataMágica",
  "ConexãoDigital",
  "InovaTech",
  "PixelPerfeito",
  "QuantumLeap",
  "CyberGuardians",
  "CidadeInteligente",
  "BrainStormTech",
  "CryptoPioneiros",
  "NanoNet",
  "VidaDigital",
  "ProjetosEstelares",
  "StudioInovação",
  "FutureFusion",
  "CodeCrafters",
  "TechSapiens",
  "DigitalDreamscape",
  "DataDynamo",
  "InfiniteInnovate",
  "QuantumQuest",
  "PixelPioneers",
  "VortexVirtuoso",
  "CyberNexa",
  "SmartSync",
  "InovaSphere",
  "TechTrailblazers",
  "NanotechNirvana",
  "CosmoCode",
  "IntelliSync",
  "InovaçãoEclética",
  "TechFoguete",
  "BitBliss",
  "HoloHarmonia",
  "VidaVirtual",
  "TechnoTranse",
  "NovaOrdemDigital",
  "ProjectProton",
  "MindMatrix",
  "FuturoFluxo",
  "TechTesserato",
  "Inovação360",
  "CyberSólido",
  "NexaNeural"
]
sender = User.create!(email: "sebastien@lewagon.org", first_name: "Sebastien", password: "123456")
receiver = User.create!(email: "boris@lewagon.org", first_name: "Boris", password: "123456")
Chatroom.create!(name: "general", sender:, receiver:)


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
20.times do

  project = Project.new({
    title: projects.sample,
    languages: skills.sample(3).join(", " ),
    category: Faker::Company.suffix,
    description: Faker::Company.catch_phrase,
    github: Faker::Internet.url
  })
    project.owner = users.sample
    project.save!
    puts "Criou o Project #{project.title}"
    end
