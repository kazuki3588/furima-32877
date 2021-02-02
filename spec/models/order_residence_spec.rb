require 'rails_helper'

RSpec.describe OrderResidence, type: :model do

  describe '商品購入機能' do

    before do
      @order_residence = FactoryBot.build(:order_residence)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@order_residence).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_residence.postal_code = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_residence.postal_code = '1231234'
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Postal code Input correctly")
    end

    it 'shipping_areaが1(---)以外でないと登録できないこと' do
      @order_residence.shipping_area_id = 1
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Shipping area cna't be blank")
    end

    it 'municipalityが空だと保存できないこと' do
      @order_residence.municipality = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'building_nameが空でも保存できること' do
      @order_residence.building_name = nil
      expect(@order_residence).to be_valid
    end

    it 'phone_numberが空でだと保存できないこと' do
      @order_residence.phone_number = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
      @order_residence.phone_number = 123456789123
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberがハイフンを含んだ形式だと保存できないこと' do
      @order_residence.phone_number = 070-1234-56789
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number Input only number")
    end

    it "phone_numberが英数混合では登録できないこと" do
      @order_residence.phone_number = 'area1234567'
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number Input only number")
    end

    it "tokenが空では登録できないこと" do
      @order_residence.token = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Token can't be blank")
    end

  end

end
