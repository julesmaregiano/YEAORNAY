class Group < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name, against: [ :name ]

  has_many :targets
  has_many :belongings
  has_many :polls, through: :targets

  validates :name, :facebook_id, presence: true
  validates_uniqueness_of :facebook_id
  validates_uniqueness_of :name
  # has_attachment :photo

  def self.search(search)
    groups = Group.all
    groups = groups.where("name LIKE ?", "%#{search[:search]}%")
  end
end
