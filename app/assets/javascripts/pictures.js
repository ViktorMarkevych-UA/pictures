$(document).ready(function() {
  manageLikes();
  initCarousel();
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

function initCarousel() {
  $('.variable-width').slick({
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true
  });
}