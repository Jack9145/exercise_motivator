require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザーの新規登録ができる時" do
    it "全ての項目が所定のフォームで入力されている時" do
      expect(@user).to be_valid
    end
  end

  describe "ユーザーの新規登録ができない時" do
    it "ニックネームが空の時" do 
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "メールアドレスが空の時" do 
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it "メールアドレスがすでに登録されている時" do 
      @user.save
      another_user = FactoryBot.build(:user,email: "test@gmail.com")
      another_user.valid?
      expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it "メールアドレスに@が含まれていない時" do
     @user.email = "aaaaaa"
     @user.valid?
     expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end

    it "パスワードが空の時" do 
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    
    it "パスワードが5文字以下の時" do 
      @user.password = "aa111"
      @user.password_confirmation =  @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    

    it "パスワードが半角数字のみの時" do 
      @user.password = "111111"
      @user.password_confirmation =  @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字を含む６文字以上で設定してください")
    end

    it "パスワードが半角英字のみの時" do 
      @user.password = "aaaaaa"
      @user.password_confirmation =  @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字を含む６文字以上で設定してください")
    end

    it "確認用パスワードが空の時" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
    end
  end
end
