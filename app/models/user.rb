# User class to registrer user for app authentication
class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable, :validatable
end
