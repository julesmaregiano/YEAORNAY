class Poll < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :targets
  validates_associated :user, presence: true
  has_attachment :photo

  def first_available_poll(user)

  end
end
