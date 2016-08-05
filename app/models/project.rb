class Project < ApplicationRecord
  has_many :users, through: :userprojects
  has_many :timers
  has_many :userprojects

  validates :title, presence: true, uniqueness: true

end
