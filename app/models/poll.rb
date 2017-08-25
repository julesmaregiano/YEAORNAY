class Poll < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :targets
  has_many :groups, through: :targets
  validates_associated :user, presence: true
  has_attachment :photo

  scope :from_me, -> (user) { where(user: user) }
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
      .first(3)
  end

  def self.list user
    from_me(user)
  end

  def yays_count
    self.answers.where(value: 1).size
  end

  def nays_count
    self.answers.where(value: 0).size
  end

  def yays_percent
    if self.answers.size != 0
      (yays_count * 100) / self.answers.size
    else
      yays_count
    end
  end

  def nays_percent
    if self.answers.size != 0
      (nays_count * 100) / self.answers.size
    else
      nays_count
    end
  end

end
