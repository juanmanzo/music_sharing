$(document).on('turbolinks:load', function(){
    
    $('.glyphicon-chevron-right').on('click', function(){
        try{
        var colorThief = new ColorThief();
        var sourceImage = $('.active').children('img')[0];
        var color = colorThief.getPalette(sourceImage, 3);
        $(document.body).css('background-color', 'rgb('+ color[0] + ')');
        }
        catch (err){
            console.log(err);
        }
    });
    
    
    
});