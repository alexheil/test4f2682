var merchLightbox = function() {

  $('.artist-merch-indiv-buy-button').click(function() {
    $('.artist-merch-indiv-lightbox-shadow, .artist-merch-indiv-lightbox').show();
  });

  $('.artist-merch-indiv-lightbox-shadow, .artist-merch-lightbox-title-right').click(function() {
    $('.artist-merch-indiv-lightbox-shadow, .artist-merch-indiv-lightbox').hide();
  });


  $('.artist-merch-buy-button').click(function() {
    $(this).next('.artist-merch-lightbox-shadow').show();
    $(this).next().next('.artist-merch-lightbox').show();
  });

  $('.artist-merch-lightbox-shadow, .artist-merch-lightbox-title-right').click(function() {
    $('.artist-merch-lightbox-shadow, .artist-merch-lightbox').hide();
  });



  $('.artist-merch-image-click').click(function() {
    $('.artist-merch-image-lightbox-shadow, .artist-merch-image-lightbox').show();
  });

  $('.artist-merch-image-lightbox-shadow').click(function() {
    $('.artist-merch-image-lightbox-shadow, .artist-merch-image-lightbox').hide();
  });

};

$(document).ready(merchLightbox);
$(document).on('page:load', merchLightbox);
