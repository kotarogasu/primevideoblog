$(document).ready(function(){
  $('.main-image').bxSlider({
    auto: true,           // 自動スライド
    mode: "fade",
    speed: 1200,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 5000,          // 自動スライドの待ち時間
    maxSlides: 4,         // 一度に表示させる最大数
    responsive: true,
    slideMargin: 50, 
    slideWidth: 1500,      // 各スライドの幅
	  randomStart: true,    // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
  });
});

$(document).ready(function(){
  $('.thumbnails').bxSlider({
    speed: 500,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 3500,          // 自動スライドの待ち時間
    maxSlides: 5,         // 一度に表示させる最大
    minSlides: 1,
    responsive: true,
    // slideMargin: 0, 
    slideWidth: 330,      // 各スライドの幅
    touchEnabled:false,  //リンク対策
	  randomStart: false,    // 最初に表示するスライドをランダムに設定
    infiniteLoop:false,   //ループしない
    hideControlOnEnd:true, //次にスライドがない場合矢印が消える
  }); 
});