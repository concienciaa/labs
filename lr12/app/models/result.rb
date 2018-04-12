class Result < ApplicationRecord
  validates :param, uniqueness: true, presence: true, null: false

  validates :res, presence: true, null: false
  
end
