class Organization < ApplicationRecord
  has_many :volunteers
  has many :users, through: :volunteers
end
