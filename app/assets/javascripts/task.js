$(function(){
  $('.main__header__user').hover(function(){
      $("ul:not(:animated)", this).slideDown();
  }, function(){
      $("ul.main__header__user__menu",this).slideUp();
  });
});