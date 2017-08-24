class Group < ApplicationRecord
  has_many :targets
  has_many :belongings
  has_many :polls, through: :targets
  validates :name, presence: true
  # has_attachment :photo
end
