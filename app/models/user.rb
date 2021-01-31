class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_letter_REGEX = /\A[ぁ-んァ-ン一-龥々]/

  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX}
    validates :nickname
    validates :first_name, format: { with: VALID_letter_REGEX}
    validates :last_name, format: { with: VALID_letter_REGEX}
    validates :first_name_kana, format: { with: VALID_KATAKANA_REGEX}
    validates :last_name_kana, format: { with: VALID_KATAKANA_REGEX}
    validates :birth_day
  end

  has_many :items
  has_many :orders
  
end