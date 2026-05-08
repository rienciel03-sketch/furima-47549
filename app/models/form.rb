class OderAddress
  include ActiveModel::ActiveModel 
  attr_accessor :postcode, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validatas :postcode,  format: { with: /\A[0-9]{3}[-][0-9]{4}\z/}
    validatas :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}
    validatas :municipality, 
    validatas :address, 
    validatas :building_name, 
    validatas :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validatas :order_id

    def save
      order = Order.create(user_id: current_user.id, item_id: @item.id)
      Address.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
  end
    