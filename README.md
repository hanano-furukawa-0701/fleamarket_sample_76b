# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false,unique,index:true|
### Association
- has_many :todo_lists
- has_many:user_evaluations
- has_many :seller_items(foreign_key:"seller_id",class_name:items)
- has_one:profiles,dependent: :destroy
- has_one:sending_destinations,dependent: :destroy
- has_one:credit_cards,dependent: :destroy


## user_evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|item_id|references|null: false,foreign_key:true|
|evaluation_id|references|null: false,foreign_key:true|
|review|text|null: false|
### Association
- belongs_to:users
- belongs_to:items
- belongs_to:active_hash:evaluations


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|string|null: false|
### Association
has_meny:user_evaluations


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false,unique:true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false,foreign_key:true|
### Association
- belongs_to:users

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|famliy_name|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_day|date|null: false|
|introduction|text|
|avatar|string|
|user_id|references|null: false,foreign_key:true|
### Association
- belongs_to:users


## todo_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|list|text|null: false|
### Association
- belongs_to:users


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|point|integer|
### Association
- belongs_to:users 

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand_id|references|null: false,foreign_key:true|
|item_conditions_id|references|null: false,foreign_key:true|
|category_id|references|null: false,foreign_key:true|
|seller_id|references|null: false,foreign_key:true|
|buyer_id|references|null: false,foreign_key:true|
|deal_closed_date|timestamps|
### Association
- belongs_to_active_hash:sizes
- belongs_to_active_hash:postage_payers
- belongs_to_active_hash:item_conditons
- belongs_to_active_hash:preparation_days
- belongs_to_active_hash:postage_types
- belongs_to:brads
- belongs_to_:seller,class_name:"users"
- belongs_to_:buyer,class_name:"users"

## itemimgsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false,foreign_key:true|
|url|string|null:false|

### Association
belongs_to:items


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null:false|
### Association
has_many :items

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
has_many :items


## item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|
### Association
has_many :items

## postage_payerテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payer|string|null: false|
### Association
has_many :items

## preparation_daysテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null: false|
### Association
has_many :items

## postage_payerテーブル
|Column|Type|Options|
|------|----|-------|
|postage_type|string|null: false|
### Association
has_many :items

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name |string|null: false|
|destination_family_name |string|null: false|
|destination_first_name_kana |string|null: false|
|post_code |integer(7)|null: false|
|prefecture_code|integer|null: false|
|city |string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number |integer|null: false|unique:true|
### Association
belongs_to:users
