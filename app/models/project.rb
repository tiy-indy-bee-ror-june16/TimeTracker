class Project < ApplicationRecord
  has_many :users, through: :userprojects
  has_many :timers
  has_many :userprojects
  belongs_to :owner, :class_name => :User, :foreign_key => "owner_id"
  validates :owner_id, presence: true

  validates :title, presence: true, uniqueness: true

end
