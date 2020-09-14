class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :given_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :given_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end

  with_options presence: true, length: { minimum: 6 } do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }
  end

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :items
  has_many :purchases
end
