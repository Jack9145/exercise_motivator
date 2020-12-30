require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post, user_id: @user.id)
    @post.image = fixture_file_upload("app/assets/images/muscle.jpg")
    @post.save
    @comment = FactoryBot.build(:comment, user_id: @user.id, post_id: @post.id)
    sleep(0.5)
  end
  describe 'コメント雨が投稿できるとき' do
    it 'ユーザーと投稿が存在していて、所定のフォームでコメントが入力されたとき' do
      expect(@comment).to be_valid
    end
  end

  describe 'コメントが投稿できないとき' do
    it 'コメントが空のとき' do
      @comment.text = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Textを入力してください")
    end

    it 'コメントが150字を超えるとき' do
      @comment.text = "a"*151
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Textは150字以内で入力してください")
    end

    it 'ユーザーが存在しないとき' do
      @comment.user_id = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Userを入力してください")
    end

    it 'コメントする投稿が存在しないとき' do
      @comment.post_id = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Postを入力してください")
    end
  end
end