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

  # Hours worked on a project
  def self.total_hours project_id
    self.where(project_id: project_id).map { |wp| (wp.end_time - wp.start_time) / 60 / 60}.inject(&:+)
  end

  def self.invoice_all
    self.where(invoiced: false).each do |wp|
      if wp.update(invoiced: true)
        puts "Successfully updated invoiced status #{wp.title}"
      else
        raise "Unable to update invoiced status #{wp.title}"
      end
    end
  end
end
