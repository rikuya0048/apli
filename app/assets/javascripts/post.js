$(function () {
  $('#menu_link').click(function () {
    $('.icon_link_tab').addClass('open');
  });
  $('.close_btn').click(function () {
    $('.icon_link_tab').removeClass('open');
  });
});

$(function () {
  $('i#user').on('click', () => {
    $('.head-user-hidden').show('');
  });
});

$(function () {
  $('i#search').on('click', () => {
    $('.header-search-form').show('');
    $('i#search').remove('');
  });
});








// $(function () {
//   $('button').on('click', () => {
//     $('.menu-bar').show('');
//   });

//   $('.menu-btn').on('click', () => {
//     $('.menu-btn').hide('');
//     $('.menu-bar').hide('')
//   });
// });
