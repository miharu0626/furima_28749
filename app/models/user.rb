class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  with_options presence: true, length: { minimum: 6 } do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }
  end

  with_options presence: true, uniqueness: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :given_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :given_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end


  #validates :nickname, presence: true
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  #validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  #VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  #validates :password_confirmation, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  #validates :family_name, presence: true, uniqueness: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  #validates :given_name, presence: true, uniqueness: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  #validates :family_name_kana, presence: true, uniqueness: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  #validates :given_name_kana, presence: true, uniqueness: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  #validates :birth_day, presence: true

  has_many :items
  has_many :purchases
end
