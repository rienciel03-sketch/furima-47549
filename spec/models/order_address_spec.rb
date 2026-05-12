require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @order = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
end

describe '商品の購入' do
  context '商品を購入できるとき' do
    it '全ての情報を入力でき、userとitemが紐づいているとき' do
      expect(@order).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @order.building_name = nil
      expect(@order).to be_valid
    end
  end
  context '商品を購入できないとき' do
    it 'user_idが紐づいていない' do
      order = FactoryBot.build(:order_address, item_id: @item.id)
      order.valid?
      expect(order.errors.full_messages).to include("User must exist")
    end
    it 'item_idが紐づいていない' do 
      order = FactoryBot.build(:order_address, user_id: @user.id)
      order.valid?
      expect(order.errors.full_messages).to include("Item must exist")
    end
    it 'tokenが空では保存できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postcodeが空では保存できない'
     @order.postcode = nil
     @order.valid?
     expect(@order.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeが半角数値でないと保存できない' do
      @order.postcode = '０１２３４５６７８９'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode is not a number")
    end
    it 'postcodeの前半が3桁でないと保存できない' do
      @order.postcode = '０１２７'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode is invalid")
    end
    it 'postcodeの後半が4桁でないと保存できない' do
      @order.postcode = '０１２３４５６'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode is invalid")
    end
    it 'postcodeにハイフンが含まれていないと保存できない' do
      @order.postcode = '０１２３４５６７'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode is invalid")
    end
     
    it 'prefecture_idが空では保存できない' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefectureに「---」が選択されている場合は購入できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalityが空では保存できない' do
      @order.municipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空では保存できない' do
      @order.address
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空では保存できない' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数値でないと保存できない' do
      @order.phone_number = '０１２３４５６７８９'
      @order.valid?   
      expect(@order.errors.full_messages).to include("Phone number is not a number")
    end
    it 'phone_numberが10文字未満では保存できない' do
      @order.phone_number = Faker::Number.number(digits: 9)
      @order.valid? 
      expect(@order.errors.full_messages).to include("Phone number must be 10 digits")
    end
    it 'phone_numberが11文字以上では保存できない' do
      @order.phone_number = Faker::Number.number(digits: 11)
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number must be 10 digits")
    end
    it 'phone_numberにハイフンが含まれていないと保存できない' do
      @order.phone_number = Faker::Number.number(digits: 10)
      @order.valid? 
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
  end


    




end

end
