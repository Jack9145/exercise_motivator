require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in '確認用パスワード', with: @user.password_confirmation

      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect {
        find('input[name = "commit"]').click}.to change {User.count}.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: ""
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      fill_in '確認用パスワード', with: ""

      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect {
        find('input[name = "commit"]').click}.to change {User.count}.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
  context 'ユーザーログイン' do
    it '正しい情報を入力すればログインができてトップページに移動する' do
      # ログインするユーザーを保存
      @user.save
      # トップページに移動する
      visit root_path
      #トップページにサインインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押すと、トップページに遷移する
      find('input[name = "commit"]').click
      expect(current_path).to eq root_path
      # サインインページへ遷移するボタンや、新規登録ページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      # ログインしたユーザーの名前が表示されていることを確認する
      expect(page).to have_content(@user.nickname)
    end
  
    it '誤った情報をを入力すれとログインができずログインページに戻ってくる' do
      # ログインするユーザーを保存
      @user.save
      # トップページに移動する
      visit root_path
      #トップページにサインインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      # ログインボタンを押すと、ログインページに遷移する
      find('input[name = "commit"]').click
      expect(current_path).to eq  new_user_session_path
    end
  end

  context 'ユーザーのログアウト' do
    it 'ログインした状態でログアウトボタンを押すと、ログアウトしてトップページへ戻る' do
      # ログインするユーザーを保存
      @user.save
      # トップページに移動する
      visit root_path
      #トップページにサインインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押すと、トップページに遷移する
      find('input[name = "commit"]').click
      expect(current_path).to eq root_path
      #ログアウトボタンがあるか確認する
      expect(page).to have_content('ログアウト')
      #ログアウトボタンを押すと、トップページに戻ってくることを確認する
      find('a[name=logout]').click
      expect(current_path).to eq root_path
      #ログアウトボタンやニックネームが表示されないことを確認する
      expect(page).to have_no_content('ログアウト')
      expect(page).to have_no_content(@user.nickname)
    end
  end
  
end
