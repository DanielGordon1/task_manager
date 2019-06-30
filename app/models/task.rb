class Task < ApplicationRecord
  validates :action, presence: true, uniqueness: true
  after_validation :update_completed_at, if: :will_save_change_to_completed?
  # only when completed_at attribute is nil
  def mark_as_completed
    completed_at.nil? ? self.completed = true : errors.add(:completed, 'This task has already been marked as completed')
  end

  scope :desc, -> { order(created_at: :desc) }

  private

  def update_completed_at
    self.completed_at = DateTime.now
  end
end
