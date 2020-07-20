require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end
    context 'valid' do 
      it 'is valid with a nickname, email, password, last_name, first_name, last_name_kana, first_name_kana, birth' do
        expect(@user).to be_valid
      end

      it 'is valid with a password that has more than 6 and combination of alphanumeric characters' do
        user = build(:user, password: 'test123', password_confirmation: 'test123')
        user.valid?
        expect(user).to be_valid
      end

      it 'is valid with a combination of alphanumeric characters' do
        user = build(:user, password: 'abcd123', password_confirmation: 'abcd123')
        user.valid?
        expect(user).to be_valid
      end

      it 'is valid with a last_name_kana 全角カタカナ' do
        @user.last_name_kana = "ゼンカクカナ"
        @user.valid?
        expect(@user).to be_valid
      end

      it 'is valid with a first_name_kana 全角カタカナ' do
        @user.first_name_kana = "ゼンカクカナ"
        @user.valid?
        expect(@user).to be_valid
      end
    end
    
    context 'invalid' do
      it 'is invalid without a nickname' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end

      it 'is invalid without a email' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid with a duplicate email address' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include('has already been taken')
      end

      it 'is invalid without @ to email' do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end

      it 'is invalid without a password' do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid with a password that has less than 5 characters' do
        user = build(:user, password: '00000', password_confirmation: '00000')
        user.valid?
        expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'is invalid with a number only characters' do
        user = build(:user, password: '1234567', password_confirmation: '1234567')
        user.valid?
        expect(user.errors[:password]).to include('は6文字以上の半角英数字混合です。')
      end

      it 'is invalid with an alphabet only characters' do
        user = build(:user, password: 'abcdefg', password_confirmation: 'abcdefg')
        user.valid?
        expect(user.errors[:password]).to include('は6文字以上の半角英数字混合です。')
      end

      it 'is invalid without a password_confirmation although with a password' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'is invalid without a last_name' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors[:last_name]).to include("can't be blank")
      end

      it 'is invalid without a first_name' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it 'is invalid without a last_name_kana' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("can't be blank")
      end

      it 'is invalid without a first_name_kana' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end

      it 'is invalid without a birth' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors[:birth]).to include("can't be blank")
      end
    end
  end
end
