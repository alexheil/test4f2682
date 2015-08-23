var albumLightbox = function() {

  $('.artist-album-cover-art-click').click(function() {
    $('.artist-album-lightbox-shadow, .artist-album-lightbox').show();
  });

  $('.artist-album-lightbox-shadow').click(function() {
    $('.artist-album-lightbox-shadow, .artist-album-lightbox').hide();
  });

};

$(document).ready(albumLightbox);
$(document).on('page:load', albumLightbox);



var lyricsAndTrack = function() {

  $('.artist-album-track-listing-mini-play').click(function() {
    var allLyrics = $('.artist-album-indiv-info-right');
    var trackSource = $(this).next('.artist-album-track-url').html();
    var trackTitle = $(this).parent().find('.artist-album-track-title').text();
    allLyrics.hide();
    $(this).closest('.artist-album-indiv-info-left').next('.artist-album-indiv-info-right').show();
    $( 'audio' ).attr( 'src', trackSource);
    $('#total_duration').text('00:00');
    $('.artist-album-indiv-track-title').text(trackTitle)
    if (music.paused) {
      music.play();
      pButton.className = "";
      pButton.className = "pause";
    }
  });

};

$(document).ready(lyricsAndTrack);
$(document).on('page:load', lyricsAndTrack);
