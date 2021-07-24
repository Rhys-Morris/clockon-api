class Project < ApplicationRecord
  belongs_to :client
  belongs_to :user

  # Validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :color, presence: true
  validates :due_date, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :billable, inclusion: { in: [true, false] }

  def self.with_client_name
    with_clients = self.all.to_a.map(&:serializable_hash)
    with_clients = with_clients.each do |proj|
      proj[:client] = self.find(proj["id"]).client.name
    end
    with_clients
  end
end