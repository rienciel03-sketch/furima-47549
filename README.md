#usersテーブル

|Column              |Type     |Options               |
|--------------------|-------- |--------------------  |
|nickname            |string   |null:false            |
|email               |string   |null:false,unique:true|
|encrypted_password  |string   |null:false            |
|family_name         |string   |null:false            |
|first_name          |string   |null.false            |
|family_name_kana    |string   |null:false            |
|first_name_kana     |string   |null:false            |
|birth_day           |date     |null:false            |

 has_many :items
 has_many :purchase_records

#itemsテーブル

|Column           |Type      |Options               |
|-----------------|--------  |--------------------  |
|image            |text      |null:false            |
|name             |string    |null:false            |
|introduction     |text      |null:false            |
|category         |text      |null:false            |
|condition        |text      |null.false            |
|shipping-cost    |string    |null:false            |
|shipping-from    |string    |null:false            |
|shipping-time    |string    |null:false            |
|price            |string    |null:false            |
|user             |references|null:false,foreign key|

be_longs_to :users
has_one :purchase_records

#purchase_recordsテーブル

|Column           |Type      |Options               |
|-----------------|--------  |--------------------  |
|item             |references|null:false,foreign key|
|user             |references|null:false,foreign key|

be_longs_to :items
be_longs_to :users


#addressesテーブル

|Column           |Type      |Options               |
|-----------------|--------  |--------------------  |
|postcode         |string    |null:false            |
|prefecture       |string    |null:false            |
|minicipality     |string    |null:false            |
|address          |string    |null:false            |
|building-name    |string    |                      |
|phone-number     |string    |null:false            |
|user             |references|null:false,foreign key|

has_one :purchase_records
