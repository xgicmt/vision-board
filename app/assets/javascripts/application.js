//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
var USERNAME = 'xgicmt0';
var API_KEY = '39897bce9cebadddcab8';

$(document).ready(function() {
  $('#js-desires').on('keyup', function(e) {
    if ( !$('#js-desires').val() ){
      $('#previews').empty();
    }
//  $('#js-desires').on('submit', function(e) {
    var URL = "http://pixabay.com/api/?username="+USERNAME+"&key="+API_KEY+"&q="+encodeURIComponent($("#js-desires").val());
    $.getJSON(URL, function(data){
        var counter = 0;
        if (parseInt(data.totalHits) > 0) {
    //        while (counter < 6) {
      console.log(data.totalHits); 
              $.each(data.hits, function(i, hit){
                $('<img class="searchedImages" id="'+ hit.id +' "src="' + hit.previewURL + '" width="150" height="150" draggable="true" ondragstart="drag(event)"data="'+ hit.webformatURL +'">').load(function () {
                  if ($(hit.id).length > 0){   
                    $(this).appendTo('#previews');
                  }
                })
              })
    //          counter += 1;
    //        }
        }
        else {
            console.log('No hits'); 
        }
    });
  });
});


function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}


// $(document).ready(function() {
//  $('#js-desires').on('keyup', function(e) {
//    var URL = "http://pixabay.com/api/?username="+USERNAME+"&key="+API_KEY+"&q="+encodeURIComponent($("#js-desires").val());
//    $.getJSON(URL, function(data){
//        var counter = 0;
//        if (parseInt(data.totalHits) > 0) {
//            while (counter < 6) {
//              $.each(data.hits, function(i, hit){
//                $('<img src="' + hit.webformatURL + '">').load(function () {
//                    $(this).appendTo('#previews');
//                })
//              })
//              counter += 1;
//            }
//        }
//        else {
//            console.log('No hits'); 
//        }
//    });
//  });
//});