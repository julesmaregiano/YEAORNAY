class Poll < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :targets
  validates_associated :user, presence: true
  has_attachment :photo
end
