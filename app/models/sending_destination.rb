class SendingDestination < ApplicationRecord
  belongs_to :user,optional: true
  validates :destination_first_name, :destination_family_name, :destination_first_name_kana, 
  :destination_family_name_kana, :prefecture_name,:City,
  :address,presence: true
  validates :post_code, format:{with:/\A\d{7}\z/,message:"は、半角数字で入力してください"}
  validates :destination_first_name, :destination_family_name, format: { with: /[^\x01-\x7E]+/, message: "は、全角で入力してください"}
  validates :destination_first_name_kana, :destination_family_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: "は、全角カタカナで入力してください"}
  include JpPrefecture
  jp_prefecture :prefecture_name
  
end
