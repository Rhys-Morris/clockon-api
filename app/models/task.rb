class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # Validations
  validates :title, presence: true, length: { maximum: 100 }
  validates :completed, inclusion: { in: [ true, false ] }
  validates :estimated_hours, presence: true, numericality: { greater_than: 0.0, less_than: 1000.0}

  # Get highest priority tasks
  def self.priority
    priority_tasks = self
      .all
      .order(:due_date)
      .reject { |task| task.completed }
      .slice(0..4)
    self.with_project_details(priority_tasks)
  end

  def self.with_project_details tasks
    tasks.map(&:serializable_hash).each do |task|
      project = self.find(task["id"]).project
      task[:project] = project.name
      task[:project_color] = project.color
    end
  end

end
