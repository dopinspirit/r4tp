class Project

  attr_accessor :tasks, :due_date

  def initialize()
    @tasks = []
    super
  end

  def done?
    @tasks.each do |task|
     return false unless task.done?
    end
  end

  def total_size
    tasks.sum(&:size)
  end

  def remaining_size
    tasks.reject(&:complete?).sum(&:size)
  end

  def completed_velocity
    tasks.sum(&:points_toward_velocity)
  end

  def current_rate
    completed_velocity * 1.0 / Project.velocity_legth_in_days
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    return false if projected_days_remaining.nan?
    projected_days_remaining.days.from_now < @due_date
  end

  def self.velocity_legth_in_days
    21
  end

end