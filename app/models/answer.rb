class Answer < ApplicationRecord
  belongs_to :poll
  belongs_to :user
  validates :value, inclusion: { in: [0, 1] }, presence: true # Il faudras changer ça!
  validates_associated :user, :poll, presence: true
end
