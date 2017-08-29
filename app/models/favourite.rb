class Favourite < ApplicationRecord
  belongs_to :poll
  belongs_to :user
  validates_associated :poll, presence: true
  validates_associated :user, presence: true
  validates_uniqueness_of :poll, scope: :user
end
