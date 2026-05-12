class OrderAddress
  include ActiveModel::Model 
  attr_accessor :postcode, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end
   validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}


  def save
    ActiveRecord::Base.transaction do
     order = Order.create(user_id: user_id, item_id: item_id)
     Address.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
   end
end