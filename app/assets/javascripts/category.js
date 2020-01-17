$(function(){
  function appendChildOptions(child){
    var child_option =`<option value="${child.id}" class="child-option">${child.name}</option>`
    $('#child-select').append(child_option);
  }

  // 親カテゴリーが変わったら
  $('#category-wraps').on('change','#category-select', function(){
    var parent_id = $(this).val();
    $.ajax({
      url: "/products/category_find",
      type: "GET",
      dataType: 'json',
      data: {
        category_id: parent_id
      }
    })
    .done(function(children){
      $("#child-wrap").show();
      $('.child-option').remove();
      $('#child-select').append(`<option value="" class="child-option">---</option>`);
      children.forEach(function(child){
        appendChildOptions(child)
      })
    });
  });

  if(window.location.href.match(/\/products\/new/)){
    // 商品の出品ページ用js
    $("#child-wrap").hide();
    
  }else if (window.location.href.match(/\/products/)){
    // 商品の出品失敗ページ、編集ページ
    $("#child-wrap").show();

    let root_id = $('#category-select').val();
    $.ajax({
      url: "/products/category_find",
      type: "GET",
      dataType: 'json',
      data: {
        category_id: root_id
      }
    })
    .done(function(children){
      children.forEach(function(child){
        appendChildOptions(child)
      })
    });


  // ロードして即 
    parent_id = $('#child-select').val();
    $.ajax({
      url: "/products/category_find",
      type: "GET",
      dataType: 'json',
      data: {
        category_id: parent_id
      }
    })
    .done(function(children){
      children.forEach(function(child){
        appendGrandChildOptions(child)
      })
 
    })
  }
});
