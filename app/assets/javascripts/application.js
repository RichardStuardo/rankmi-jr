// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require tinymce
//= require rails-ujs
//= require activestorage
//= require_tree .

// Función para mantener el título del index
function Codepen(posx, posy)
{
  
  var shadow_count      = 20;
  var shadow_width      = 10;
  var shadow_opacity    = 0.3;
  var shadow_limit      = 150;
  var shadow_settings   = [];
  var shadows           = [];
  
  var y = posy - $('#text-span').offset().top - 40;
  var x = posx - $('#text-span').offset().left - ($('#text-span').width()/2);
  
  if(y < 0 && y < -shadow_limit)
  {
    y = -shadow_limit;
  }
  else if(y > shadow_limit)
  {
    y = shadow_limit;
  }
  
  if(x < 0 && x < -shadow_limit)
  {
    x = -shadow_limit;
  }
  else if(x > shadow_limit)
  {
    x = shadow_limit;
  }
  
  for(i = 0; i < shadow_count; i++)
  {if (window.CP.shouldStopExecution(1)){break;}
    shadow_settings.push({
      x: ((-x)/shadow_count)*i,
      y: ((-y)/shadow_count)*i,
      width: shadow_width*i,
      opacity: shadow_opacity - (shadow_opacity/shadow_count)*i
    });
  }
window.CP.exitedLoop(1);

  
  for(key in shadow_settings)
  {if (window.CP.shouldStopExecution(2)){break;}
    shadows.push(shadow_settings[key].x + 'px ' + shadow_settings[key].y + 'px ' + shadow_settings[key].width + 'px rgba(0,0,0,' + shadow_settings[key].opacity + ')');
  }
window.CP.exitedLoop(2);

  
  $('#text').css({
      'text-shadow': shadows.join(',')
  });
  
}

$('#container').mousemove(function(e){
  Codepen(e.pageX, e.pageY);
});

Codepen($(window).width()/2, -200);