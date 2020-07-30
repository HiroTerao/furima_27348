require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#create' do
    before do
      @transaction = build(:transaction)
    end

    context 'valid' do
      it 'is valid with a post_code, prefecture_code_id, city, house_number, phone_number, item_id' do
        expect(@transaction).to be_valid
      end

      it 'is valid building_name is nil' do
        @transaction.building_name = nil
        expect(@transaction).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid without a post_code' do
        @transaction.post_code = nil
        @transaction.valid?
        expect(@transaction.errors[:post_code]).to include("can't be blank")
      end

      it 'is invalid without a no hyphen on post_code' do
        @transaction.post_code = '1111111'
        @transaction.valid?
        expect(@transaction.errors[:post_code]).to include('郵便番号にはハイフンが必要です。')
      end

      it 'is invalid without a prefecture_code_id' do
        @transaction.prefecture_code_id = nil
        @transaction.valid?
        expect(@transaction.errors[:prefecture_code_id]).to include("can't be blank")
      end

      it 'is invalid without a city' do
        @transaction.city = nil
        @transaction.valid?
        expect(@transaction.errors[:city]).to include("can't be blank")
      end

      it 'is invalid without a house_number' do
        @transaction.house_number = nil
        @transaction.valid?
        expect(@transaction.errors[:house_number]).to include("can't be blank")
      end

      it 'is invalid without a phone_number' do
        @transaction.phone_number = nil
        @transaction.valid?
        expect(@transaction.errors[:phone_number]).to include("can't be blank")
      end

      it 'is invalid with phone_number on hyphen' do
        @transaction.phone_number = '090-1111-2222'
        @transaction.valid?
        expect(@transaction.errors[:phone_number]).to include('電話番号にはハイフンは不要で11桁以内です。')
      end
    end
  end
end
