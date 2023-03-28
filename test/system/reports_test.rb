# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    Report.destroy_all
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    assert_text 'ログインしました。'
  end

  test '#CRUD Reports' do
    click_link '日報'
    click_on '新規作成'
    fill_in 'タイトル', with: '今日は大変'
    fill_in '内容', with: '大変だったよ'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '今日は大変'
    assert_text '大変だったよ'

    click_link '編集'
    fill_in 'タイトル', with: '今日は大変じゃなかったよ'
    fill_in '内容', with: '大変じゃなかったよ'
    click_button '更新する'
    assert_text '日報が更新されました。'
    assert_text '今日は大変じゃなかったよ'
    assert_text '大変じゃなかったよ'

    fill_in 'comment[content]', with: '最高だったよ'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text '最高だったよ'

    click_link '戻る'
    within 'table' do
      assert_text '今日は大変じゃなかったよ'
      click_link '削除'
      accept_confirm
    end
    assert_text '日報が削除されました。'
    within 'table' do
      assert_no_text '今日は大変じゃなかったよ'
    end
  end
end
