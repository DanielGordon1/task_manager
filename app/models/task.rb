class Task < ApplicationRecord
  validates :action, presence: true, uniqueness: true
end
