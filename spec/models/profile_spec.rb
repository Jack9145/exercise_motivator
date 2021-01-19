require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end
  describe "プロフィールが登録できる時" do
    it "全ての項目が所定のフォームで入力された時" do
      expect(@profile).to be_valid
    end
  end

  describe "プロフィール登録ができないとき" do
    it "身長が入力されていない時" do
      @profile.height = ""
      @profile.valid?
      expect(@profile.errors.full_messages).to include("身長を入力してください")
    end

    it "身長が4桁以上の数字で入力されている時" do
      @profile.height = "1000"
      @profile.valid?
      expect(@profile.errors.full_messages).to include("身長は不正な値です")
    end
    
    it "体重が入力されていない時" do
      @profile.weight = ""
      @profile.valid?
      expect(@profile.errors.full_messages).to include("体重を入力してください")
    end

    it "体重が4桁以上で入力されている時" do
      @profile.weight = 1000
      @profile.valid?
      expect(@profile.errors.full_messages).to include("体重は不正な値です")
    end
  end
end
