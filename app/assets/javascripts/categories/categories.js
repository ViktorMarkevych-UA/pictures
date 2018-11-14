$( document ).on('turbolinks:load', function() {
  $('#dialog').on('show', function(){
  });


  $( "#tags" ).autocomplete({
    source: $('#tags').data('autocomplete-source')
  });
});