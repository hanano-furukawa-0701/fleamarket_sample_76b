class SendingDestination < ApplicationRecord
  belongs_to :user,optional: true
  validates :destination_first_name, :destination_family_name, :destination_first_name_kana, 
  :destination_family_name_kana, :post_code, :prefecture_code,:City,
  :address,presence: true
  validates :destination_first_name, :destination_family_name, format: { with: /[^\x01-\x7E]+/, message: "は、全角で入力してください"}
  validates :destination_first_name_kana, :destination_family_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: "は、全角カタカナで入力してください"}
  validates :post_code, format: { with: /\A\d{7}}\z/, message: "は、ハイフンなしの半角数字7文字で入力してください"}
  include JpPrefecture
  jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  def prefecture_name=(prefecture_name)
    if prefecture_code.present?
      self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end
  end
end
