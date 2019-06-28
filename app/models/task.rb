class Task < ApplicationRecord
  validates :action, presence: true, uniqueness: true
  after_validation :update_finished_at, if: :will_save_change_to_done?
  # only when finished_at attribute is nil
  def mark_as_done
    finished_at.nil? ? self.done = true : errors.add(:done, 'This task has already been marked as done')
  end

  scope :desc, -> { order(created_at: :desc) }

  private

  def update_finished_at
    self.finished_at = DateTime.now
  end
end
