class Task

  attr_accessor :size, :completed_at

  def initialize(options={})
    @size = options[:size]
    @completed_at = options[:completed_at]
  end

  def done?
    complete?
  end

  def complete?
    @completed_at.nil? ? false : true
  end

  def mark_completed(date=Time.now)
    @completed_at = date
  end

  def points_toward_velocity
    part_of_velocity? ? @size : 0
  end

  def part_of_velocity?
    complete? && @completed_at > Project.velocity_legth_in_days.days.ago
  end

end