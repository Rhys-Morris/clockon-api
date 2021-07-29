class WorkPeriod < ApplicationRecord
  belongs_to :project

  # Validations
  validates :title, length: { maximum: 100 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :invoiced, inclusion: { in: [true, false] }

  def self.with_project_details
    self.all.to_a.map(&:serializable_hash).each do |wp|
      linked_project = self.find(wp["id"]).project
      wp[:project] = linked_project.name
      wp[:project_color] = linked_project.color
    end
  end
end
