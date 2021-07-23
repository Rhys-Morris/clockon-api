class Client < ApplicationRecord
  belongs_to :user
  has_many :projects

  # Validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP}, length: { maximum: 40 }
  validates :contact, length: { maximum: 40 }
  validates :active, inclusion: { in: [true, false] }
end
