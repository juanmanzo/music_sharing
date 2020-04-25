var cached = 0;
$(document).on('turbolinks:load', function(){
  
  console.log(cached);
  $('#my-img').on("load", function() {
      var colorThief = new ColorThief();
      var sourceImage = $('#my-img')[0];
     
      // Get the dominant color of image
      try{
        console.log("called2");
        cached = cached + 1;
        var color = colorThief.getPalette(sourceImage, 3);
        console.log(color);
        // Use the new color as background for body
        if(color[1][0] < 100 || color[1][1] < 100 || color[1][2] < 100){
          $('.alb-flag').css('color', 'white');
          $('#spotify-link').css('color', 'white');
        }
        if(color[0][0] < 100 || color[0][1] < 100 || color[0][2] < 100){
        $('.color-flag').css('color', 'white');
      }
       if(color[2][0] < 100 || color[2][1] < 100 || color[2][2] < 100){
        $('.username-color-change').css('color', 'white');
      }
        $('#color-change').css('background-color', 'rgb(' + color[0] + ')');
        $('#my-img').css('border-color', 'rgb('+ color[2] + ')');
        $('.details-well').css('background-color', 'rgb('+ color[1] + ')');
        $(document.body).css('background-color', 'rgb('+ color[2] + ')');
          console.log(color[2]);
        $('.des-bg').css({
            'background-color': 'rgb('+ color[0] + ')',
              'border': '5px outset '+ 'rgb(' + color[2] + ')'
            });
        }
      catch(err){
        console.log(err.message);
      }
    });
    
    if (cached > 0){
 
    // Get the dominant color of image
    try{
      console.log("called3");
      var colorThief = new ColorThief();
      var sourceImage = $('#my-img')[0];
     var color = colorThief.getPalette(sourceImage, 3);
    // Use the new color as background for body
    if(color[1][0] < 100 || color[1][1] < 100 || color[1][2] < 100){
      $('.alb-flag').css('color', 'white');
      $('#spotify-link').css('color', 'white');
    }
    if(color[0][0] < 100 || color[0][1] < 100 || color[0][2] < 100){
      $('.color-flag').css('color', 'white');
    }
    if(color[2][0] < 100 || color[2][1] < 100 || color[2][2] < 100){
        $('.username-color-change').css('color', 'white');
      }
    
    
    $('#color-change').css('background-color', 'rgb(' + color[0] + ')');
    $('#my-img').css('border-color', 'rgb('+ color[2] + ')');
    $('.details-well').css('background-color', 'rgb('+ color[1] + ')');
      $(document.body).css('background-color', 'rgb('+ color[2] + ')');
      console.log(color[2]);
    $('.des-bg').css({
          'background-color': 'rgb('+ color[0] + ')',
            'border': '5px outset '+ color[1]
          });
    }
    catch(err){
      console.log(err.message);
    }
    
  }
});