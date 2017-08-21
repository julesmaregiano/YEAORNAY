# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Suppression des datas existantes"
User.destroy_all
Poll.destroy_all
Answer.destroy_all
Group.destroy_all
puts 'Users, Polls, Answers & Groups supprimés.'

first_name = ['Jerome', 'Ophélie', 'Jules', 'Arnaud']
last_name = ['Vivier', 'Delrieu', 'Maregiano', 'APRAHAMIAN']
email = ['jerome.vivier@edhec.com','ophelie.delrieu3@orange.fr', 'jules.maregiano@gmail.com', 'arnaud.aprahamian@gmail.com']
photo_url = ['https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/11709247_10206311692807977_6592313504708086650_n.jpg?oh=2999ffd774b07fd32e14cbd751e96913&oe=5A356408', 'https://scontent-cdg2-1.xx.fbcdn.net/v/t31.0-1/c348.0.960.960/p960x960/14542538_10207929828985442_1702045537103892698_o.jpg?oh=ab794795797586cd1a3261fc7ccdfc70&oe=5A323BF0', 'https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/11026142_10153369592714788_3993364344459696435_n.jpg?oh=47564b9b9f6b5b1f05670c19bc2f8e88&oe=59EFE3D4', 'https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/20841823_1488940124502033_1504670497674323338_n.jpg?oh=50044d80a2eb734c7820d5ac84d44f21&oe=5A32C238']

puts 'Génération des users...'
user1 = User.new(last_name: 'Yeah', first_name:'Nay', email:'yeahornay@yeahornay.com', birth_date: Date.new(2004,4,12), sexe: 'Homme', level: 5, password: 'coucou', photo_url: 'https://www.fillmurray.com/300/300')
user1.save!
puts 'User 1 creé'
for i in (0..3) do
  User.new(last_name: last_name[i], first_name: first_name[i], email: email[i], birth_date: birth_date[i], sexe: usersexe[i], level: level[i], password: 'coucou', photo_url: photo_url[i]).save!
  puts "User #{i + 2} créé"
end
puts 'Done.'

#Bijoux, voitures, chaussures

puts 'Génération des Polls'
context = ["Vous en pensez quoi ?", "Si je met ça à un mariage, yay ou nay?", "Je le prend ? Vite j'ai 10min!! merci!!", "J'hésite à les prendre les filles, yay ou nay?", "85€, je prend?", "Je rencontre mes beaux-parents demain, YoN ?? :))", "Pour aller à la plage", "Moche?", ""]
ends_at = Tim
