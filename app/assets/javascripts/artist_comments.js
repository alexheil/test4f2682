var micropostComments = function() {
  $('.artist-micropost-comment-click').click(function() {
    $(this).closest('.artist-micropost-social')
             .next('.artist-micropost-comments-container').toggle();
  });

  $('.fan-artist-micropost-comment-click').click(function() {
    $(this).closest('.fan-artist-micropost-social')
             .next('.fan-artist-micropost-comments-container').toggle();
  });
};

$(document).ready(micropostComments);
$(document).on('page:load', micropostComments);
