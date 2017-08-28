class UsersLoginJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    # Do something later
    puts "Début"
    user = User.find(user_id)
    user.add_groups
    puts "Fin"
  end
end
