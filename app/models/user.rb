class User < ApplicationRecord

  has_secure_password
  has_many :projects, through: :userprojects
  has_many :timers
  has_many :userprojects

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true



end
