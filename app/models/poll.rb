class Poll < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :answers, dependent: :destroy
  has_many :targets
  has_many :groups, through: :targets
  has_many :favourites
  validates_associated :user, presence: true
  has_attachment :photo, accept: [:jpg, :jpeg, :png, :gif]

  scope :from_me, -> (user) { where(user: user) }
  scope :latest_to_old, -> { order(ends_at: :desc)}
  scope :ending_soon, -> { order(ends_at: :asc) }
  scope :not_from, -> (user) { where.not(user: user) }
  scope :ongoing, -> { where("ends_at > ?", DateTime.now) }
  scope :not_answered_by, -> (user) { where('polls.id NOT IN (SELECT DISTINCT(poll_id) FROM answers WHERE user_id = ?)', user.id) }
  scope :targeting, -> (user) { joins(:targets).where('targets.group_id IN (SELECT DISTINCT(group_id) FROM belongings WHERE user_id = ?)', user.id) }

  def self.answerable user
    # Le poll ne doit pas appartenir à l'utilisateur
    # Le poll ne doit encore être terminé
    # Le poll ne doit pas encore avoir de réponse de l'utilisateur
    ongoing
      .not_from(user)
      .not_answered_by(user)
      .targeting(user)
      .ending_soon
      .first(1)
  end

  def self.list user
    from_me(user)
      .latest_to_old
  end

  def yays_count
    ays_count(1)
  end

  def nays_count
    ays_count(0)
  end

  def yays_percent
    ays_percent(1)
  end

  def nays_percent
    ays_percent(0)
  end

  private 

  def ays_count(value)
    answers.where(value: value).size
  end
  
  def ays_percent(value)
    ays_count(value) * ( answers.size.zero? ? 1 : 100.0 / self.answers.size )
  end
  
  
end
