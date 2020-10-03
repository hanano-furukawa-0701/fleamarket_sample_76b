class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        validates :Nickname,:First_name,:Family_name,:First_name_kana,:Family_name_kana,:Birth_day,presence: true
        validates :email, format: { with: /\A[\x21-\x3f\x41-\x7e]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i, message: "は、~@~.~の形で入力してください"}
        validates :First_name,:Family_name, format: { with: /[^\x01-\x7E]+/, message: "は、全角で入力してください"}
        validates :First_name_kana,:Family_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: "は、全角カタカナで入力してください"}
        has_one :sending_destination

        has_one :credit_card, dependent: :destroy

        has_many :items

end
