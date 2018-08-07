//= require jquery.jcarousel.min.js

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

(function($) {
  $(function() {
    var jcarousel = $('.jcarousel');

    jcarousel
      .on('jcarousel:reload jcarousel:create', function () {
        var carousel = $(this),
          width = carousel.innerWidth();

        if (width >= 600) {
          width = width / 3;
        } else if (width >= 350) {
          width = width / 2;
        }

        // carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
      })
      .jcarousel({
        wrap: 'circular'
      });

    $('.jcarousel-control-prev')
      .jcarouselControl({
        target: '-=1'
      });

    $('.jcarousel-control-next')
      .jcarouselControl({
        target: '+=1'
      });

    $('.jcarousel-pagination')
      .on('jcarouselpagination:active', 'a', function() {
        $(this).addClass('active');
      })
      .on('jcarouselpagination:inactive', 'a', function() {
        $(this).removeClass('active');
      })
      .on('click', function(e) {
        e.preventDefault();
      })
      .jcarouselPagination({
        perPage: 1,
        item: function(page) {
          return '<a href="#' + page + '">' + page + '</a>';
        }
      });
  });
})(jQuery);
