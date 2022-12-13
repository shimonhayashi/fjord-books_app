//= require rails-ujs <--削除
//= require jquery <--追加
//= require jquery_ujs <--追加
//= require activestorage
//= require turbolinks
//= require jquery.jpostal <--追加
//= require_tree .

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#user_postal_code').jpostal({
      postcode : [
        '#user_postal_code'
      ],
      address: {
        "#user_prefecture_code": "%3", // # 都道府県が入力される
        "#user_city"           : "%4%5", // # 市区町村と町域が入力される
        "#user_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});


// # 入力項目フォーマット
// #   %3  都道府県
// #   %4  市区町村
// #   %5  町域
// #   %6  大口事業所の番地 ex)100-6080
// #   %7  大口事業所の名称
