require 'rails_helper'

RSpec.describe Trade, type: :model do
   describe '#create' do
    before do
      @trade = build(:trade)
    end

    context 'valid' do
      it 'is valid with a post_code, prefecture_code_id, city, house_number, phone_number, item_id' do
        expect(@trade).to be_valid
      end

      it 'is valid building_name is nil' do
        @trade.building_name = nil
        expect(@trade).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid without a post_code' do
        @trade.post_code = nil
        @trade.valid?
        expect(@trade.errors[:post_code]).to include("can't be blank")
      end

      it 'is invalid without a no hyphen on post_code' do
        @trade.post_code = '1111111'
        @trade.valid?
        expect(@trade.errors[:post_code]).to include('郵便番号にはハイフンが必要です。')
      end

      it 'is invalid without a prefecture_code_id' do
        @trade.prefecture_code_id = nil
        @trade.valid?
        expect(@trade.errors[:prefecture_code_id]).to include("can't be blank")
      end

      it 'is invalid without a city' do
        @trade.city = nil
        @trade.valid?
        expect(@trade.errors[:city]).to include("can't be blank")
      end

      it 'is invalid without a house_number' do
        @trade.house_number = nil
        @trade.valid?
        expect(@trade.errors[:house_number]).to include("can't be blank")
      end

      it 'is invalid without a phone_number' do
        @trade.phone_number = nil
        @trade.valid?
        expect(@trade.errors[:phone_number]).to include("can't be blank")
      end

      it 'is invalid with phone_number on hyphen' do
        @trade.phone_number = '090-1111-2222'
        @trade.valid?
        expect(@trade.errors[:phone_number]).to include('電話番号にはハイフンは不要で11桁以内です。')
      end
    end
  end
end
