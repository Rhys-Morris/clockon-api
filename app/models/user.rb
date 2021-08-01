class User < ApplicationRecord
    has_secure_password
    has_many :clients, dependent: :destroy
    has_many :projects, dependent: :destroy
    has_many :work_periods, dependent: :destroy
    has_many :tasks, dependent: :destroy

    #Validations
    validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/i}, length: { maximum: 40 }
    validates :password, presence: true, length: { minimum: 8 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP}

end
