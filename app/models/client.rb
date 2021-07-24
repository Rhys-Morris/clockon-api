class Client < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP}, length: { maximum: 40 }
  validates :contact, length: { maximum: 40 }
  validates :active, inclusion: { in: [true, false] }

  def self.with_project_numbers
    self.all.to_a.map(&:serializable_hash).each do |client|
      client[:project_count] = self.find(client["id"]).projects.length
    end
  end
end
