require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'When access to top-page without log-in, redirect to log-in-page' do
    # visit top-page
    visit root_path
    # confirm redirecting to log-in-page if you are not log-in-user.
    expect(current_path).to eq(new_user_session_path)
  end

  it 'Success to log-in, and take top-page' do
    # create user account in DB
    @user = FactoryBot.create(:user)
    # visit log-in-page
    visit new_user_session_path
    # confirm here is log-in-page
    expect(current_path).to eq(new_user_session_path)
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    # ログインボタンをクリックする
    click_on 'Log in'
    # トップページに遷移していることを確認する
    expect(current_path).to eq(root_path)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)
    # 誤ったユーザー情報を入力する
    fill_in 'Email', with: 'unchi@unchi'
    fill_in 'Password', with: @user.password
    # ログインボタンをクリックする
    find('input[name="commit"]').click                    #click_on 'Log in'でもOK
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq(new_user_session_path)
  end
end