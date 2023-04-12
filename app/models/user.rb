class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :repositories
  has_many :projects
  has_many :boilerplates
  has_many :repositories, through: :projects

  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :email, presence: true, uniqueness: true
# validates :name, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, length: { minimum: 6 }
end
