require 'rails_helper'

RSpec.describe "UserSpecs", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in '名前',	with: 'test_01'
          fill_in 'メールアドレス', with: 'a@example.com'
          fill_in 'パスワード', with: "12345678"
          fill_in 'パスワード確認', with: "12345678"
          click_button '送信'
          expect(current_path).to eq login_path
          expect(page).to have_content('ユーザー登録が完了しました')
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: "12345678"
          fill_in 'パスワード確認', with: "12345678"
          click_button '送信'
          expect(current_path).to eq users_path
          expect(page).to have_content("メールアドレスを入力してください")
        end
      end

      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'メールアドレス', with: user.email
          fill_in 'パスワード', with: "12345678"
          fill_in 'パスワード確認', with: "12345678"
          click_button '送信'
          expect(current_path).to eq users_path
          expect(page).to have_content('メールアドレスはすでに存在します')
          expect(page).to have_no_content user.email
        end
      end
    end
  end
end
