class User < ApplicationRecord
    has_secure_password

    #Validations
    validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/i}
    validates :password, presence: true, length: { minimum: 8 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP}

end
