class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name, presence: true, uniqueness: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :given_name, presence: true, uniqueness: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true, uniqueness: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :given_name_kana, presence: true, uniqueness: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true

  has_many :items
  has_many :purchases
end
