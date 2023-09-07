class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections
  has_many :pitches, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validations
  validates :first_name, :last_name, :skills, :description, :github, presence: true

  has_many :projects, foreign_key: "owner_id"
  has_many :members
  has_one_attached :photo
end
