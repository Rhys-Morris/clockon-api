class Client < ApplicationRecord
  belongs_to :user

  # Validations
  validates :name, presence: true, length: {maximum: 40}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :active, inclusion: { in: [true, false] }
end
