class Task < ApplicationRecord
  belongs_to :user
  enum status: %i(unstarted started finished)
end
