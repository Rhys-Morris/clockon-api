class Project < ApplicationRecord
  belongs_to :client
  belongs_to :user

  has_many :tasks
  has_many :expenses
  has_many :work_periods

  # Validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :color, presence: true
  validates :due_date, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :billable, inclusion: { in: [true, false] }
  validates :billable_rate, numericality: { less_than: 10000, greater_than: 0 }

  def self.with_client_names
    self.all.to_a.map(&:serializable_hash).each do |proj|
      proj[:client] = self.find(proj["id"]).client.name
    end
  end

  def self.with_additional_details(id)
    client_name = self.find(id).client.name
    work_periods = self.find(id).work_periods
    added_details = self.find(id).serializable_hash
    added_details[:client] = client_name
    added_details[:work_periods] = work_periods
    added_details
  end
end
