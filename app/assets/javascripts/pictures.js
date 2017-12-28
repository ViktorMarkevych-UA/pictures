$(document).ready(function() {
  managePositiveLike();
  manageNegativeLike();
});


function managePositiveLike() {
  $('body').on('click', '.like-icons .glyphicon-heart', function(){
    var pictureId = $(this).parent().data('pictureId');
    var icon = $(this);
    $.ajax('/pictures/' + pictureId + '/positive_likes', {
      type: 'post',
      dataType: 'json',
      success: function(data) {
        icon.find('span').text(data);
      }
    });
  });
}

function manageNegativeLike() {
  $('body').on('click', '.like-icons .glyphicon-heart-empty', function(){
    var pictureId = $(this).parent().data('pictureId');
    var icon = $(this);
    $.ajax('/pictures/' + pictureId + '/negative_likes', {
      type: 'post',
      dataType: 'json',
      success: function(data) {
        icon.find('span').text(data);
      }
    });
  });
}