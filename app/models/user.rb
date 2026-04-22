class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :items
    has_many :purchase_records


  validates :nickname, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英数字の混合である必要があります'}
  validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Namekana kana Full-width katakana characters"}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Namekana kana Full-width katakana characters"}
  validates :birth_day, presence: true
 
end