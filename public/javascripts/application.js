$(function(){
  $('article.topic').on('hover',function(){
    var topic = $(this).attr('data-topic');

    $('.current').removeClass('current');
    $('[data-topic="'+topic+'"]').addClass('current');
  });

  $('article.topic:first').trigger('mouseover');
})
