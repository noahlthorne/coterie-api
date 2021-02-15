class User < ApplicationRecord
  has_many :volunteers
  has many :organizations, through: :volunteers
end
