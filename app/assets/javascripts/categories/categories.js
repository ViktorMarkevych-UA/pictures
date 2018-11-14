$( document ).on('turbolinks:load', function() {
  console.log('here: ', $( document.getElementById("#category_name" )));
  $('#dialog').on('show', function(){
    console.log('test');
  });


  $( "#tags" ).autocomplete({
    source: $('#tags').data('autocomplete-source')
  });
});