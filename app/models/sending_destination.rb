class SendingDestination < ApplicationRecord
  belongs_to :user,optional: true
  validates :destination_first_name, :destination_family_name, :destination_first_name_kana, 
  :destination_family_name_kana, :post_code, :prefecture_code,:City,
  :address,:building_name,:phone_number,presence: true
  include JpPrefecture
  jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
