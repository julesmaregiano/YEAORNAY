class Group < ApplicationRecord
  has_many :targets
  has_many :belongings
  has_many :polls, through: :targets

  validates :name, :facebook_id, presence: true
  validates_uniqueness_of :facebook_id
  validates_uniqueness_of :name
  # has_attachment :photo

  def self.search(params)
    groups = Group.all
    groups.where("name LIKE ?", "%#{search}%")
  end
end
