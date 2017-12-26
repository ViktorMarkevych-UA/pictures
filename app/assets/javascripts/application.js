// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require freewall
// require_tree .

$(document).ready(function() {
  $('.btn-dialog').click(function() {
    $('#dialog').modal('show');
    return $('#dialog').removeClass('show_modal');
  });

  $('body').on('click', '.cell', function(){
    console.log($(this).data('image-id'));
  });
  // return $.ajax(window.location.pathname, {
  //   type: 'GET',
  //   dataType: 'json',
  //   success: function(data, textStatus, jqXHR) {
  //     return $("#candidate_source").autocomplete({
  //       source: data.sources
  //     });
  //   }
  // });

});