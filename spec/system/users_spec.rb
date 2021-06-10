require 'rails_helper'

RSpec.describe "ユーザー登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザーが新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'お名前', with: @user.teacher_name
      fill_in '高校名', with: @user.school_name
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.encrypted_password
      fill_in 'パスワード(確認)', with: @user.encrypted_password
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # ログインするとログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')

    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # ユーザー情報を入力する
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      # 新規登録ページへ戻されることを確認する
    end
  end

end
