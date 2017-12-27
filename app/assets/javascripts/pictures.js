$(document).ready(function() {
  manageLike();
});


function manageLike() {
  $('body').on('click', '.like-icons .glyphicon', function(){
    var pictureId = $(this).parent().data('pictureId');
    var icon = $(this);
    $.ajax('/pictures/' + pictureId + '/likes', {
      type: 'post',
      dataType: 'json',
      success: function(status) {
        if (status) {
          icon.removeClass('glyphicon-heart-empty').addClass('glyphicon-heart');
        } else {
          icon.removeClass('glyphicon-heart').addClass('glyphicon-heart-empty');
        }
      }
    });
  });
}