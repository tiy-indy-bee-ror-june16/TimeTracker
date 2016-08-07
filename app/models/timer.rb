class Timer < ApplicationRecord
  belongs_to :user
  belongs_to :project

  default_scope { order(created_at: :desc) }

end
