class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  resources :connections
end
