require 'faker'
require 'open-uri'
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

user_pics = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLDk_pGSeCU1lVzSpFsq2KZrFFgtBnVIUZ5i9HGLI1tx3h85nGsF7tTiEg1vf1Ygf3SPs&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROt7YUKa7excpJt4CR59ZwHzhWDfV1mr0eQ&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYH_VDaGfxQ_cPhkgDPyoxXJgnnKHzEw7kdg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST7TiVjnL2ao3BUold9yvBjJODzTJfOyar7w&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC8kiSH5ZSAcVoj3tAQQDoP_ux0sSricMyUg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEfuXC-ToT_s9eNQ7uyDihU19WD-oJ9W20A&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI6wgX3GXOmzqEQY49Kbc-UkeDkI5HwW2chw&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl6olRtD4wNmjF1K-eCgdUdE0x0cRIKUL5-w&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu10KZdnx4WAc2B3k1tt_m_HbnnhqzCOhrUA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4m5APM4w-uVWMPR9nKN2pM6bTjUqoNP8wPQ&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcX3ZmuppOa1KhiPaTIAZTMjt2UpiYA9QFPEUHiIJoZ5b6yCa2r_F29nNAyiKUQxJAUwo&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-3EhTFKxDhS_dch3tfVTyWWiQdWeWmUCVQ&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROGoqApAB56HbWYk24nXCx2q1uKZ3FkHULuA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwCOd4IfWspXRXmtkzJox9mk_vnYwYrD8Emg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcmG5F-EgBcEy6edWK0KjpOR2Lx2OkzkZR-kHjYWuq8g3FEH4J4c6IvTdIo4-VUc10mSE&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR35qan4uSCGYHR4SPq3sEuGcLCwFSaKowjMA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQRermfSqWhyTuegHdaKDnQpxZWbFnhMFahA&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR1pJog_G22VXN0T2JbehGd04hklrFBIImCg&usqp=CAU",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpFreAtrOzdfbsrEHLCtHyBDY4x80z6RBeVA&usqp=CAU"]

pitches_pics = [
  'https://itajai.sc.gov.br/img/noticias/foto/121857.jpg',
  'https://cdn.abcdoabc.com.br/braco-mecanico-cps_089e9a76.jpg',
  'https://idocode.com.br/blog/wp-content/uploads/2020/07/impressora-3d.jpg',
  'https://paginazero.com.br/homologacao/wp-content/uploads/2020/07/Barueri-Marcos-Pontes-1.jpg',
  'https://img.ibxk.com.br/2012/7/materias/2587374894125317.jpg?ims=328x',
  'https://i0.wp.com/idocode.com.br/blog/wp-content/uploads/2020/01/Ba%C3%BA-do-heitor.jpeg?fit=1024%2C967&ssl=1',
  'https://idocode.com.br/blog/wp-content/uploads/2020/01/Pixel-mamprim.jpg',
  'https://img.ibxk.com.br/2012/7/materias/2587374894125847.jpg?ims=328x',
  'https://s2-g1.glbimg.com/wAs4hNEY0QAo1nHRaIDefQUy5s4=/0x0:724x333/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2022/Q/e/xpOiojQsqJIaUghxiLaA/cao-robo.png',
  'https://images.tcdn.com.br/img/img_prod/858160/kit_robotica_lego_mindstorms_nxt_9797_education_17_1_20200918160335.jpg',
  'https://media.slidesgo.com/storage/21235973/conversions/0-technology-project-proposal-minitheme-thumb.jpg',
  'https://media.slidesgo.com/storage/21236018/responsive-images/18-technology-project-proposal-minitheme___media_library_original_459_258.jpg',
  'https://i0.wp.com/valoragregado.com/wp-content/uploads/2023/08/unnamed-2023-08-09T111926.252.jpg?ssl=1',
  'https://midias.correiobraziliense.com.br/_midias/jpg/2022/10/14/675x450/1_walking_grass-26641734.jpg?20221014170417?20221014170417',
  'https://files.passeidireto.com/993943de-1a48-4d82-995a-f7b445fbf7cc/bg1.png',
  'https://i0.wp.com/idocode.com.br/blog/wp-content/uploads/2020/01/Catapulta.jpeg?fit=1024%2C645&ssl=1',
  'https://colorindo.org/wp-content/uploads/2023/01/Dicas-completar-projetos-arte-casa-software.webp',
  'https://static.portaldaindustria.com.br/media/filer_public/ca/27/ca275166-3e38-48a9-a82b-89ee29f90fac/industria-4-0-o-que-e-seus-conceitos.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8QApDcv-GHgy8AmTuRPqYKNUrYmwkWvD_-w&usqp=CAU'
]

project_pics = [
  'https://itajai.sc.gov.br/img/noticias/foto/121857.jpg',
  'https://cdn.abcdoabc.com.br/braco-mecanico-cps_089e9a76.jpg',
  'https://idocode.com.br/blog/wp-content/uploads/2020/07/impressora-3d.jpg',
  'https://paginazero.com.br/homologacao/wp-content/uploads/2020/07/Barueri-Marcos-Pontes-1.jpg',
  'https://img.ibxk.com.br/2012/7/materias/2587374894125317.jpg?ims=328x',
  'https://i0.wp.com/idocode.com.br/blog/wp-content/uploads/2020/01/Ba%C3%BA-do-heitor.jpeg?fit=1024%2C967&ssl=1',
  'https://idocode.com.br/blog/wp-content/uploads/2020/01/Pixel-mamprim.jpg',
  'https://img.ibxk.com.br/2012/7/materias/2587374894125847.jpg?ims=328x',
  'https://s2-g1.glbimg.com/wAs4hNEY0QAo1nHRaIDefQUy5s4=/0x0:724x333/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2022/Q/e/xpOiojQsqJIaUghxiLaA/cao-robo.png',
  'https://images.tcdn.com.br/img/img_prod/858160/kit_robotica_lego_mindstorms_nxt_9797_education_17_1_20200918160335.jpg',
  'https://media.slidesgo.com/storage/21235973/conversions/0-technology-project-proposal-minitheme-thumb.jpg',
  'https://media.slidesgo.com/storage/21236018/responsive-images/18-technology-project-proposal-minitheme___media_library_original_459_258.jpg',
  'https://i0.wp.com/valoragregado.com/wp-content/uploads/2023/08/unnamed-2023-08-09T111926.252.jpg?ssl=1',
  'https://midias.correiobraziliense.com.br/_midias/jpg/2022/10/14/675x450/1_walking_grass-26641734.jpg?20221014170417?20221014170417',
  'https://files.passeidireto.com/993943de-1a48-4d82-995a-f7b445fbf7cc/bg1.png',
  'https://i0.wp.com/idocode.com.br/blog/wp-content/uploads/2020/01/Catapulta.jpeg?fit=1024%2C645&ssl=1',
  'https://colorindo.org/wp-content/uploads/2023/01/Dicas-completar-projetos-arte-casa-software.webp',
  'https://static.portaldaindustria.com.br/media/filer_public/ca/27/ca275166-3e38-48a9-a82b-89ee29f90fac/industria-4-0-o-que-e-seus-conceitos.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8QApDcv-GHgy8AmTuRPqYKNUrYmwkWvD_-w&usqp=CAU'
]

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

# sender = User.create!(email: "sebastien@lewagon.org", first_name: "Sebastien", password: "123456")
# receiver = User.create!(email: "boris@lewagon.org", first_name: "Boris", password: "123456")
# Chatroom.create!(name: "general", sender:, receiver:)
Chatroom.create!(name: "general", sender:, receiver:)


users = []
Pitch.destroy_all
10.times do
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
  file = URI.open(user_pics.shuffle!.pop)
  user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  user.save!

  users << user
  puts user.email
end


10.times do

  pitch = Pitch.new({
    title: pitches.sample,
    languages: skills.sample(3).join(", " ),
    category: Faker::Company.suffix,
    description: Faker::Company.department,
    source: "link"
  })

  pitch.user = users.sample
  url = pitches_pics.shuffle!.pop
  file = URI.open(url)
  pitch.save!
  puts "Criou o pitch #{pitch.title}"
  pet = Pet.new(pet_data)
  file = URI.open(pet_pics.shuffle!.pop)
  random_user = user_data.sample
  pitch.user = random_user
  pitch.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  pitch.save!
  puts "Criou o Pitches com a URL: #{url}"
end

10.times do

  project = Project.new({
    title: projects.sample,
    languages: skills.sample(3).join(", " ),
    category: Faker::Company.suffix,
    description: Faker::Company.catch_phrase,
    github: Faker::Internet.url
  })

  project.owner = users.sample
  url = project_pics.shuffle!.pop
  file = URI.open(url)
  project.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  project.save!
  puts "Criou o Project com a URL: #{url}"
end
