class Project < ApplicationRecord
  belongs_to :client
  belongs_to :user

  has_many :tasks
  has_many :expenses

  # Validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :color, presence: true
  validates :due_date, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :billable, inclusion: { in: [true, false] }

  def self.with_client_names
    self.all.to_a.map(&:serializable_hash).each do |proj|
      proj[:client] = self.find(proj["id"]).client.name
    end
  end

  def self.with_client_name(id)
    client_name = self.find(id).client.name
    with_client_name = self.find(id).serializable_hash
    with_client_name[:client] = client_name
    with_client_name
  end
end
