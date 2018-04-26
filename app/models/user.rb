class User < ApplicationRecord
	has_many :budgets, dependent: :destroy
	has_secure_password
end