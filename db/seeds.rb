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
facebook_picture_url = ["http://res.cloudinary.com/yay-or-nay/image/upload/v1503482894/vg5ohumoquc9brfvlcki.jpg", "http://res.cloudinary.com/yay-or-nay/image/upload/v1503482896/yptcefuagwuvrsszbart.jpg", "http://res.cloudinary.com/yay-or-nay/image/upload/v1503482898/jfqncddujly54p9lxnip.jpg", "http://res.cloudinary.com/yay-or-nay/image/upload/v1503482901/bx7btychqictejahrsqw.jpg","http://res.cloudinary.com/yay-or-nay/image/upload/v1503568888/ulflenbt57zzm6kxqypf.jpg"]

puts 'Génération des users...'
captainanon = User.new(last_name: "Captain", first_name: "Anonyme", email: "yayornaytheapp@gmail.com", password: 'coucou', facebook_picture_url: facebook_picture_url.last)
captainanon.save!
puts 'Captain Anonyme creé'
puts 'Done.'

puts 'Génération des Polls'
context = ['Vous en pensez quoi ?', 'Si je met ça à un mariage, yay ou nay?', "Je le prend ? Vite j'ai 10min!! merci!!", "J'hésite à les prendre les filles, yay ou nay?", '85€, je prend?', 'Je rencontre mes beaux-parents demain, YoN ?? :))', 'Pour aller à la plage', 'Moche?', 'Baleze non ?']
context_y = [50, 75, 25 ]
photos = ["http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/bijou_2_480_tpr3ef.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/bijou_1_360_vyq3el.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/bijou_3_480_yha3yh.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/chaussure_1_480_w3aaqt.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/chaussure_3_zil9u7.jpg",
         "https://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/chaussure_2_480_ahnnlg.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/voiture_3_480_v6sykx.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/voiture_2_720_mqzabf.jpg",
         "http://res.cloudinary.com/yay-or-nay/image/upload/v1503328479/voiture_1_720_hqe0e2.jpg"]

  yon = Group.create(facebook_id: 1696236193750789, name: "Yay or Nay", url: "http://res.cloudinary.com/yay-or-nay/image/upload/v1503673512/logo_bikdat.png")
  puts yon.id
9.times do |i|
  value = [true, false].sample
  poll = Poll.create(context: context[i], ends_at: Time.now+7200, user: User.first, photo_url: photos[i], context_y: context_y.sample, anonym: value)
  target = Target.create(poll_id: poll.id, group_id: yon.id)
  puts "Poll, anonym: #{poll.anonym}, n°#{i+1} créé avec comme target Y"
  p poll
end

puts 'Done.'
puts 'Fin du Seed'
