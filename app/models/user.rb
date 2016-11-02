class User < ApplicationRecord
  has_many :formulas

  has_secure_password
  
end
