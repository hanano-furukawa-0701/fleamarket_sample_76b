class SendingDestination < ApplicationRecord
  belongs_to :user,optional: true
  validates :destination_first_name, :destination_family_name, :destination_first_name_kana, 
  :destination_family_name_kana, :post_code, :prefecture_name,:City,
  :address,presence: true
  validates :destination_first_name, :destination_family_name, format: { with: /[^\x01-\x7E]+/, message: "は、全角で入力してください"}
  validates :destination_first_name_kana, :destination_family_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: "は、全角カタカナで入力してください"}
  include JpPrefecture
  jp_prefecture :prefecture_name
  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture_name).try(:name)
  # end
  # def prefecture_name=(prefecture_name)
  #   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end
end
