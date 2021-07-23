class Project < ApplicationRecord
  belongs_to :client
  belongs_to :user

  # Validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :color, presence: true
  validates :due_date, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :billable, inclusion: { in: [true, false] }
end
