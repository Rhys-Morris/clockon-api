class Expense < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :project
  has_one_attached :receipt

  # Validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :date, presence: true
  validates :cost, presence: true, numericality: { greater_than: 0.0, less_than: 10000.0}
end
