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
Favourite.destroy_all
Message.destroy_all
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
context = ['Nouvelle coupe, bien ?', 'Pour un mariage, yay ou nay?', "Je l'achète ou pas ?", "Pour un apéro avec des amis ?", "Nouvelle raquette, yay ou nay ?"]
context_y = [50, 75, 25]
user_id = rand(0..3).to_i
photos = ["http://res.cloudinary.com/zanzibar/image/upload/v1504261382/man_gjr4vv.png",
         "http://res.cloudinary.com/zanzibar/image/upload/v1504260631/car_rgtboz.jpg",
         "http://res.cloudinary.com/zanzibar/image/upload/v1504260631/montre_1024_vmazfv.jpg",
         "http://res.cloudinary.com/zanzibar/image/upload/v1504260631/apero_hcggv3.jpg",
          "http://res.cloudinary.com/zanzibar/image/upload/v1504260631/tennis_zhs5la.jpg"]
  yon = Group.create(facebook_id: 1696236193750789, name: "Yay or Nay", url: "https://scontent.xx.fbcdn.net/v/t1.0-1/c31.0.50.50/p50x50/20954014_1696236387084103_5962366096731458549_n.png?oh=cc4f425e9f1ba31593391324923c8605&oe=5A2CF534")
  p yon
4.times do |i|
  value = [true, false].sample
  poll = Poll.create(context: context[i], ends_at: Time.now + 7200, user: User.first, photo_url: photos[i], context_y: context_y.sample, anonym: true)
  target = Target.create(poll_id: poll.id, group_id: yon.id)
  p poll
end
#
# User.all.each do |user|
#   Poll.all.each do |poll|
#     if [true, false].sample
#       value = [0, 1].sample
#       poll.answers.create!(value: value, user: user)
#       puts "User  #{user.first_name} a répondu #{value} à #{poll.context}"
#     end
#   end
# end

puts 'Done.'
puts 'Fin du Seed'
