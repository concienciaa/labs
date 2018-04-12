class User < ApplicationRecord
  validates :login, uniqueness: true, presence: true, null: false

  validates :password, presence: true, null: false
  
end
