class Project < ApplicationRecord
  has_one_attached :avatar

  has_many :repositories
  has_many :users, through: :repositories
end
