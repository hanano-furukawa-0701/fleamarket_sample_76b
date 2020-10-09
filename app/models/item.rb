class Item < ApplicationRecord
  has_many :images,dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :condition 
  belongs_to_active_hash :payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture
  belongs_to :buyer, optional: true,class_name: "User"
end
