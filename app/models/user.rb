class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true,
                             format: {
                               with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                               message: "を全角カタカナのみで入力して下さい。"
                             }
  validates :first_name_kana, presence: true,
                               format: {
                               with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                               message: "を全角カタカナのみで入力して下さい。"
                             }

  validates :email, presence: true
  
  validates :telephone_number, presence: true,
                           format: {
                             with:   /\A\d{10,11}\z/,
                             message: "を10桁もしくは11桁の数値で入力して下さい。"
                           }
  validates :encrypted_password, presence: true
end
