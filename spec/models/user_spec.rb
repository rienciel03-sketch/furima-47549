require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録出来るとき' do
     it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
     end
    end
    context '新規登録できないとき' do
    it 'nicknameが空では保存できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では保存できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれていないと保存できない' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では保存できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では保存できない' do
      @user.password = '12ab'
      @user.password_confirmation = '12ab'
      @user.valid?  
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordとpassword_confirmationが異なる場合は保存できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '数字のみのpasswordは保存できない' do
      @user.password = '123456'
      @user.password_confirmation = 'password'
      @user.valid?  
      expect(@user.errors.full_messages).to include("Password には英数字の混合である必要があります")
    end
    it '英字のみのpasswordは保存できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英数字の混合である必要があります")
    end
    it  '全角を含むpasswordの場合は保存できない' do
      @user.password = 'ａａa １１1'
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英数字の混合である必要があります")
    end

    it 'last_nameが空では保存できない' do 
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では保存できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では保存できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では保存できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'aiうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'aiうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it  '姓（カナ）にカタカナ以外が含まれていると登録できない' do
      @user.last_name_kana = 'アイうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
    end
    it '名（カナ）にカタカナ以外が含まれていると登録できない' do
      @user.first_name_kana = 'アイうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
    end
    it 'birth_dateが空では保存できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    end
  end
end
