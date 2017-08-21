class Target < ApplicationRecord
  belongs_to :poll
  belongs_to :group
  validates_associated :poll, :group, presence: true
end
