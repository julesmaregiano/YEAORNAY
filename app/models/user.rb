class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :polls
  has_many :belongings
  has_many :groups, through: :belongings
  has_many :answers
  validates :first_name, :last_name, presence: true
  has_attachment :photo

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end
    user.add_groups
    return user
  end

  def facebook_likes # récupére les likes de l'utilisateur
    @graph = Koala::Facebook::API.new(token)

    likes = []

    feed = @graph.get_connections("me", "likes")

    until feed.nil?
      likes << feed
      feed = feed.next_page
    end
    likes.flatten  # tableau de hash
  end

  def add_groups # ajoute les pages dans la DB sauf si elles existent déjà
    self.facebook_likes.each do |like|
      url = @graph.get_picture_data(like["id"])["data"]["url"]
      group = Group.find_by(facebook_id: like["id"].to_i) || Group.find_by(name: like["name"]) || Group.create(name: like["name"], facebook_id: like["id"].to_i, url: url)
      unless Belonging.find_by(group_id: group.id, user_id: id)
        self.groups << group
        self.save
      end
    end
  end

end


