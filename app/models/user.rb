class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze

  validates :email, { format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } }
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は6文字以上の半角英数字混合です。' }

  with_options presence: true do
    validates :nickname
    validates :birth

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, last_name: 'は全角（漢字・ひらがな・カタカナ）で入力です。' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
