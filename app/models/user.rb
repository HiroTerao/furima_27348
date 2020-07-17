class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save { self.email = email.downcase }

  validates :nickname, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, { format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } }

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'は6文字以上の半角英数字混合です。' }

  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ン一-龥]/, last_name: 'は全角（漢字・ひらがな・カタカナ）で入力です。' }

  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥]/, first_name: 'は全角（漢字・ひらがな・カタカナ）で入力です。' }

  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, last_name: 'は全角（カタカナ）で入力です。' }

  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, last_name: 'は全角（カタカナ）で入力です。' }

  validates :birth, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
