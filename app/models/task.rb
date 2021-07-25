class Task < ApplicationRecord
  belongs_to :project

  # Validations
  validates :title, presence: true, length: { maximum: 100 }
  validates :due_date, presence: true
  validates :estimated_hours, presence: true, numericality: { greater_than: 0.0, less_than: 1000.0}
end
