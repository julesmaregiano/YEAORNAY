class Poll < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :targets
end
