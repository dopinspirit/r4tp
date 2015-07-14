class Task < ActiveRecord::Base

  belongs_to :project

  def done?
    complete?
  end

  def complete?
    completed_at.present?
  end

  def mark_completed(date=Time.now)
    self.completed_at = date
  end

  def points_toward_velocity
    part_of_velocity? ? size : 0
  end

  def part_of_velocity?
    complete? && completed_at > Project.velocity_legth_in_days.days.ago
  end

end