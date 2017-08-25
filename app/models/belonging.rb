class Belonging < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates_associated :group, :user, presence: true
  validates_uniqueness_of :group, scope: :user
end
