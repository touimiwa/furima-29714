require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      buyer = FactoryBot.build(:user)
      item2 = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address, user_id: buyer.id, item_id: item2.id)
    end

    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@order_address).to be_valid
    end
    it 'tokenが空だと購入できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_cordが空だと購入できないこと' do
      @order_address.postal_cord = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal cord can't be blank")
    end
    it 'area_idが空だと購入できないこと' do
      @order_address.area_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Area must be other than 0')
    end
    it 'municipalityが空だと購入できないこと' do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'placeが空だと購入できないこと' do
      @order_address.place = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Place can't be blank")
    end
    it 'phone_numberが空だと購入できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'postal_cordが半角のハイフンを含まないと購入できないこと' do
      @order_address.postal_cord = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal cord is invalid')
    end
    it 'phone_numberにはハイフンは不要で、11桁以内でないと購入できないこと' do
      @order_address.phone_number = '1111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
