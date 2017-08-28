# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Suppression des datas existantes'
Belonging.destroy_all
Target.destroy_all
Group.destroy_all
Answer.destroy_all
Poll.destroy_all
User.destroy_all
puts 'Users, Polls, Answers, Belongings, Targets & Groups supprimés.'

first_name = ['Jerome', 'Ophélie', 'Jules', 'Arnaud']
last_name = ['Vivier', 'Delrieu', 'Maregiano', 'APRAHAMIAN']
email = ['jeromevivier31@hotmail.com','ophelie.delrieu3@orange.fr', 'jmaregiano@gmail.com', 'arnaud.aprahamian@hotmail.fr']
facebook_picture_url = ["http://res.cloudinary.com/yay-or-nay/image/upload/v1503482894/vg5ohumoquc9brfvlcki.jpg", "http://res.cloudinary.com/yay-or-nay/image/upload/v1503482896/yptcefuagwuvrsszbart.jpg", "http://res.cloudinary.com/yay-or-nay/image/upload/v1503482898/jfqncddujly54p9lxnip.jpg", "http://res.cloudinary.com/yay-or-nay/image/upload/v1503482901/bx7btychqictejahrsqw.jpg"]

puts 'Génération des users...'
User.create(last_name: "Captain", first_name: "Anonyme", email: "yayornaytheapp@gmail.com", password: 'coucou', facebook_picture_url: facebook_picture_url[0], admin: true).save!
puts 'Captain Anonyme creé'
# for i in (0..3) do
#   User.create(last_name: last_name[i], first_name: first_name[i], email: email[i], password: 'coucou', facebook_picture_url: facebook_picture_url[i]).save!
#   puts "User #{i+1} créé"
# end
puts 'Done.'

puts 'Génération des Polls'
context = ['Vous en pensez quoi ?', 'Si je met ça à un mariage, yay ou nay?', "Je le prend ? Vite j'ai 10min!! merci!!", "J'hésite à les prendre les filles, yay ou nay?", '85€, je prend?', 'Je rencontre mes beaux-parents demain, YoN ?? :))', 'Pour aller à la plage', 'Moche?', 'Baleze non ?']
context_y = [50, 75, 25]
user_id = rand(0..3).to_i
photos = ["http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/bijou_2_480_tpr3ef.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/bijou_1_360_vyq3el.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/bijou_3_480_yha3yh.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/chaussure_1_480_w3aaqt.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/chaussure_3_zil9u7.jpg",
         "https://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/chaussure_2_480_ahnnlg.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/voiture_3_480_v6sykx.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/voiture_2_720_mqzabf.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/voiture_1_720_hqe0e2.jpg"]
  yon = Group.create(facebook_id: 1696236193750789, name: "Yay or Nay", url: "https://scontent.xx.fbcdn.net/v/t1.0-1/c31.0.50.50/p50x50/20954014_1696236387084103_5962366096731458549_n.png?oh=cc4f425e9f1ba31593391324923c8605&oe=5A2CF534")
  p yon
9.times do |i|
  value = [true, false].sample
  poll = Poll.create(context: context[i], ends_at: Time.now+7200, user: User.first, photo_url: photos[i], context_y: context_y.sample, anonym: value)
  target =Target.create(poll_id: poll.id, group_id: yon.id)
  p poll
  print " crée!"
end

puts 'Done.'
puts 'Fin du Seed'
