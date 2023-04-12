class Repository < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :project
  belongs_to :boilerplate
end
