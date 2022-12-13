// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

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

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
