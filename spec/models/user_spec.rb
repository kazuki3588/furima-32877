require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'name,email,password,password_confirmation,last_name,first_name,last_furigana,first_furigana,dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationがからでは登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_furiganaが空では登録できない' do
        @user.last_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last furigana can't be blank"
      end
      it 'first_furiganaが空では登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First furigana can't be blank"
      end
      it 'dateが空では登録できない' do
        @user.date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date can't be blank"
      end
      it 'passwordとpassword_confirmationが5文字以下では登録できない' do
        @user.password = 'ram35'
        @user.password_confirmation = 'ram35'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passordとpassword_confirmationが半角英数字混合でなければ登録できない' do
        @user.password = '7777777'
        @user.password_confirmation = '7777777'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'ユーザー本名が全角(漢字,ひらがな,カタカナ)での入力でなければ登録できない' do
        @user.last_name = 'kuramoto'
        @user.first_name = 'kazuki'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters', 'First name Full-width characters'
      end
      it 'ユーザー本名のフリガナが全角(カタカナ)での入力でなければ登録できない' do
        @user.last_furigana = '藏本'
        @user.first_name = '一起'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last furigana Full-width katakana characters'
      end
      it 'passwordとpassword_confirmationが一致でなければ登録できない' do
        @user.password = '35rrrrr'
        @user.password_confirmation = '35rrrr'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'メールアドレスに@が含まれていなければ登録できない' do
        @user.email = 'hukuhuku.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '7777777'
        @user.password_confirmation = '7777777'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it "passwordが全角では登録できないこと" do
        @user.password = "７７７７７７７kq"
        @user.password_confirmation = "７７７７７７７kq"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
    end
  end
end
