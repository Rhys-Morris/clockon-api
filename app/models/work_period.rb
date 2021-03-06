class WorkPeriod < ApplicationRecord
  belongs_to :project

  # Validations
  validates :title, length: { maximum: 100 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :invoiced, inclusion: { in: [true, false] }
  
  def self.with_project_details
    hashed_work_periods = self.all.to_a.map(&:serializable_hash)
    add_project_details(hashed_work_periods)
  end

  # Hours worked on a project
  def self.total_hours project_id
    self.where(project_id: project_id)
      .map { |wp| ((wp.end_time - wp.start_time) / 60.0 / 60.0) / 1000.0 }
      .inject(&:+)
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

  def self.last_week
    # Time points to reject by need to be moving hence cannot use 1.week.ago
    exact_week = 604800000
    wp_in_last_week = self.all
      .reject { |wp| wp.end_time <  ((Time.zone.now.to_f * 1000) - exact_week) }
      .to_a
      .map(&:serializable_hash)
    add_project_details(wp_in_last_week)
  end

  def self.last_month
    exact_week = 604800000
    wp_in_last_month = self.all
      .reject { |wp| wp.end_time <  ((Time.zone.now.to_f * 1000) - (exact_week * 6)) }
      .to_a
      .map(&:serializable_hash)
    add_project_details(wp_in_last_month)
  end

  def self.add_project_details work_periods
    work_periods.each do |wp|
      linked_project = self.find(wp["id"]).project
      wp[:project] = linked_project.name
      wp[:project_color] = linked_project.color
      wp[:project_rate] = linked_project.billable_rate
    end
  end
end
