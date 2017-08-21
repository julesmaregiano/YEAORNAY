class Group < ApplicationRecord
  has_many :targets
  has_many :belongings
end
