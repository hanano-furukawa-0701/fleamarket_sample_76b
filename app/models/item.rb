class Item < ApplicationRecord
  has_many :images,dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to_active_hash :condition 
  belongs_to_active_hash :payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture
  belongs_to :buyer, optional: true,class_name: "User"

  validates :images,presence: { message: "は１枚以上投稿してください" }
  validates :name,presence: { message: "を入力してください" }
  validates :explanation,presence: { message: "を入力してください" }
  validates :condition_id,presence: { message: "商品の状態を入力してください" }
  validates :prefecture_id,presence: { message: "発送元の都道府県を入力してください" }
  validates :payer_id,presence: { message: "送料の負担者を入力してください" }
  validates :preparation_day_id,presence: { message: "発送までの日数を入力してください" }
  validates :price,presence: { message: "を入力してください" }
end
