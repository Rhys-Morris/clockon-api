class WorkPeriod < ApplicationRecord
  belongs_to :project

  # Validations
  validates :title, length: { maximum: 100 }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
