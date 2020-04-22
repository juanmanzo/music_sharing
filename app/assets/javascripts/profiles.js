$(document).on('turbolinks:load', function(){
    $(window).on("load", function() {
    var colorThief = new ColorThief();
    var sourceImage = $('#my-img')[0];
 
  // Get the dominant color of image
  color = colorThief.getPalette(sourceImage, 3);
  console.log(color);
  // Use the new color as background for body
  if(color[1][0] < 75 && color[1][1] < 75 && color[1][2] < 75){
    $('.alb-flag').css('text-shadow', '0px 1px 0 #FFF,0px -1px 0 #FFF');
  }
  $('#color-change').css('background-color', 'rgb(' + color[0] + ')');
  $('#my-img').css('border-color', 'rgb('+ color[2] + ')');
  $('.details-well').css('background-color', 'rgb('+ color[1] + ')');
  $(document.body).css('background-color', 'rgb('+ color[2] + ')');
  $('.des-bg').css('background-color', 'rgb('+ color[0] + ')');
    });
});