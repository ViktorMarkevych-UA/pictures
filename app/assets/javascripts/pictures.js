$(document).ready(function() {
  manageLikes();
});

function manageLikes() {
  $('body').on('click', '.glyphicon-heart-empty, .glyphicon-heart', function(){
    var parent = $(this).parent();
    var pictureId = parent.data('pictureId');
    var icon = $(this);
    var partUrl = '/' + icon.data('url');
    $.ajax('/pictures/' + pictureId + partUrl, {
      type: 'post',
      dataType: 'json',
      success: function(data) {
        $.each(data, function(k, v){
          parent.find('[data-url=' + k + '] span').text(v);
        });
      }
    });
  });
}