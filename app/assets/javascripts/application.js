var USERNAME = 'xgicmt0';
var API_KEY = '39897bce9cebadddcab8';

$(document).ready(function() {
  $('#js-desires').on('keyup', function(e) {
    var URL = "http://pixabay.com/api/?username="+USERNAME+"&key="+API_KEY+"&q="+encodeURIComponent($("#js-desires").val());
    $.getJSON(URL, function(data){
        var counter = 0;
        if (parseInt(data.totalHits) > 0) {
            while (counter < 6) {
              $.each(data.hits, function(i, hit){
                $('<img src="' + hit.webformatURL + '">').load(function () {
                    $(this).appendTo('#previews');
                })
              })
              counter += 1;
            }
        }
        else {
            console.log('No hits'); 
        }
    });
  });
});