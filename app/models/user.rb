class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections
  has_many :pitches, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # Google sign in:
         :omniauthable, omniauth_providers: [:google_oauth2]
  # validations
  # validates :first_name, :last_name, :skills, :description, :github, presence: true

  has_many :projects, foreign_key: "owner_id"
  has_many :members
  has_one_attached :photo

    # for Google OmniAuth

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name,
  against: [ :first_name, :last_name ],
  using: {
    tsearch: { prefix: true } # used for getting incomplete words
  }

  def self.from_omniauth(auth)
    current_user = find_by(email: auth.info.email)
    return current_user if current_user.present?

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
