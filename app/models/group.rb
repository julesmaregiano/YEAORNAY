class Group < ApplicationRecord
  has_many :targets
  has_many :belongings
  validates :name, :icon, presence: true
  has_attachment :photo
end
