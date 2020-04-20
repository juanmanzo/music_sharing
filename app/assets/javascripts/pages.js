$(document).on('turbolinks:load', function(){
  $('.alert').delay(1000).fadeOut(4000);
  
  $('select').on('change', function(event ) {
       //restore previously selected value
       var prevValue = $(this).data('previous');
       $('select').not(this).find('option[value="'+prevValue+'"]').show();
       //hide option selected                
       var value = $(this).val();
       //update previously selected data
       $(this).data('previous',value);
       $('select').not(this).find('option[value="'+value+'"]').hide();
   });
  
  
  
});