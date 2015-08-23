var artistGenres = function() {

  var genreContainer = $('.artist-discover-genre-container-all-genres, .artist-discover-genre-container')
  var genreTitle = $('.artist-discover-genre-title-click')

  $('#all-genres').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-all-genres').toggle();
  });

  $('#alternative').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-alternative').toggle();
  });

  $('#ambient').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-ambient').toggle();
  });

  $('#blues').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-blues').toggle();
  });

  $('#childrens-music').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-childrens-music').toggle();
  });

  $('#christian-gospel').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-christian-gospel').toggle();
  });

  $('#classical').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-classical').toggle();
  });

  $('#comedy').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-comedy').toggle();
  });

  $('#country').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-country').toggle();
  });

  $('#dance').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-dance').toggle();
  });

  $('#electronic').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-electronic').toggle();
  });

  $('#experimental').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-experimental').toggle();
  });

  $('#fitness-workout').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-fitness-workout').toggle();
  });

  $('#hip-hop-rap').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-hip-hop-rap').toggle();
  });

  $('#holiday').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-holiday').toggle();
  });

  $('#indie').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-indie').toggle();
  });

  $('#jazz').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-jazz').toggle();
  });

  $('#latino').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-latino').toggle();
  });

  $('#metal').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-metal').toggle();
  });

  $('#pop').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-pop').toggle();
  });

  $('#rb-soul').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-rb-soul').toggle();
  });

  $('#rock').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-rock').toggle();
  });

  $('#singer-songwriter').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-singer-songwriter').toggle();
  });

  $('#soundtrack').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-soundtrack').toggle();
  });

  $('#world').click(function() {
    genreTitle.removeClass('genre-selected');
    $(this).addClass('genre-selected');
    genreContainer.hide();
    $('#container-world').toggle();
  });

};

$(document).ready(artistGenres);
$(document).on('page:load', artistGenres);
