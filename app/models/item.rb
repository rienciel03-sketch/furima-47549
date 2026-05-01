class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :user
 has_one_attached :image

 #has_one :purchase_record
 belongs_to :category
 belongs_to :condition  
 belongs_to :shipping_cost
 belongs_to :prefecture
 belongs_to :shipping_time


 validates :name, presence: true
 validates :introduction, presence: true
 validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
 validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
 validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank" }
 validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
 validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank" }
 validates :price, presence: true
end
