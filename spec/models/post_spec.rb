require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.image = fixture_file_upload("app/assets/images/muscle.jpg")
  end 
  describe "投稿ができる時" do
    it "全ての入力項目が所定のフォームで入力されている時" do
      expect(@post).to be_valid
    end
  end

  describe "投稿ができない時" do
    it "タイトルが空の時" do
      @post.title = ""
      @post.valid?
      expect(@post.errors.full_messages).to include("タイトルを入力してください")
    end

    it "タイトルが50文字を超えている時" do
      @post.title = "a"*51
      @post.valid?
      expect(@post.errors.full_messages).to include("タイトルは50文字以内で入力してください")
    end

    it "画像が投稿されていない時" do
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("画像を入力してください")
    end

    it "テキストが空の時" do
      @post.text = ""
      @post.valid?
      expect(@post.errors.full_messages).to include("テキストを入力してください")
    end
    
    it "テキストが200字を超えている時" do
      @post.text = "a"*201
      @post.valid?
      expect(@post.errors.full_messages).to include("テキストは200文字以内で入力してください")
    end
    
  end
end
