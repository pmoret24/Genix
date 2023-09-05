class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  # validations
  validates :first_name, :last_name, :skills, :description, :github, presence: true
end
