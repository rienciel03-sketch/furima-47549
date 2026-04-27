class Item < ApplicationRecord
 belongs_to :user
 has_one_attached :image

 #has_one :purchase_record
 #belongs_to :category
 #belongs_to :condition  


 validates: name, presence: true
 validates: introduction, presence: true
 validates: category_id, presence: true
 validates: condition_id, presence: true
 validates: shipping_cost__id, presence: true
 validates: prefecture_id, presence: true
 validates: shipping_time_id, presence: true
 validates: price, presence: true
end
