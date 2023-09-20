# User class to registrer user for app authentication
class User < ApplicationRecord
  # Add revocation strategy to user model
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Devise modules
  devise :database_authenticatable, :registerable, :validatable,
         # devise-jwt modules.
         :jwt_authenticatable, jwt_revocation_strategy: self
end
