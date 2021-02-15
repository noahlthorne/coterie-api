class User < ApplicationRecord
  has_many :volunteers, dependent: :destroy
  has_many :organizations, through: :volunteers
end
