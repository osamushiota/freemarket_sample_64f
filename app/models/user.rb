class User < ApplicationRecord
  has_many :items, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :password, :password_confirmation, presence: true
end

# のちのバリデーション用にキープ
# validates :nickname, :email, :password, :password_confirmation, :surname, :first_name, :surname_kana, :first_name_kana, :phone, :card_number, 
# :expiration_month, :expiration_year, :security_code, :birth_year, :birth_month, :birth_day, presence: true
