$(document).ready(function(){
  $('.main-image').bxSlider({
    auto: true,           // 自動スライド
    mode: "fade",
    speed: 1200,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 4000,          // 自動スライドの待ち時間
    maxSlides: 4,         // 一度に表示させる最大数
    responsive: true,
    touchEnabled:false,  //リンク対策
    slideMargin: 50, 
    slideWidth: 1500,      // 各スライドの幅
	  randomStart: true,    // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
  });
});

$(document).ready(function(){
  var w = $(window).width();
  var x = 480;
  if (w >= x) {var width = 320 }else { var width = 200};
    $('.card-area').bxSlider({
      speed: 500,          // スライドするスピード
      moveSlides: 1,        // 移動するスライド数
      pause: 3500,          // 自動スライドの待ち時間
      maxSlides: 5,         // 一度に表示させる最大
      minSlides: 2,
      responsive: true,
      pager:false,
      slideMargin: 1, 
      slideWidth: width,      // 各スライドの幅
      touchEnabled:false,  //リンク対策
      randomStart: false,    // 最初に表示するスライドをランダムに設定
      infiniteLoop:false,   //ループしない
      hideControlOnEnd:true, //次にスライドがない場合矢印が消える
    }); 
});

// $(document).ready(function(){
//   $('.card-area-small').bxSlider({
//     speed: 500,          // スライドするスピード
//     moveSlides: 1,        // 移動するスライド数
//     pause: 3500,          // 自動スライドの待ち時間
//     maxSlides: 5,         // 一度に表示させる最大
//     minSlides: 0,
//     responsive: true,
//     slideMargin: 10, 
//     slideWidth: 200,      // 各スライドの幅
//     touchEnabled:false,  //リンク対策
// 	  randomStart: false,    // 最初に表示するスライドをランダムに設定
//     infiniteLoop:false,   //ループしない
//     hideControlOnEnd:true, //次にスライドがない場合矢印が消える
//   }); 
// });