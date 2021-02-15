class User < ApplicationRecord
  has_many :volunteers
  has_many :organizations, through: :volunteers
end
