class Project < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [500, 500]
  has_many :repositories
  has_many :users, through: :repositories
end
