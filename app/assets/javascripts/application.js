//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
var USERNAME = 'xgicmt0';
var API_KEY = '39897bce9cebadddcab8';

$(document).ready(function() {
  $('#js-desires').on('keyup', function(e) {
    if ($('#js-desires').val().length === 0){ $('#previews').empty(); }

  if($('#js-desires').val().length > 1){
    var URL = "http://pixabay.com/api/?username="+USERNAME+"&key="+API_KEY+"&q="+encodeURIComponent($("#js-desires").val());
      $.getJSON(URL, function(data){
      //  var counter = 0;
      //  console.log(data);
        if (parseInt(data.totalHits) > 0) {
              $.each(data.hits, function(i, hit){
                //$('<img class="searchedImages" id="'+ hit.id +' "src="' + hit.previewURL + '" width="150" height="150" draggable="true" ondragstart="drag(event)"data="'+ hit.webformatURL +'">').load(function () {
                 // if ($(hit.id).length > 0){  
                $('<img class="searchedImages" id="' + hit.webformatURL + '" src="' + hit.previewURL + '" width="150" height="150" draggable="true" ondragstart="drag(event)">').load(function () {
                  if ($('#' + hit.id).length === 0){   
                    $(this).prependTo('#previews');
                  }//end if id exists
                })
              })
        }
        else {
            console.log('No hits'); 
        }
    });
    }//end if input is greater than 1
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

$(function(){ //DOM Ready
 
    $(".gridster ul").gridster({
        widget_margins: [0, 10],
        widget_base_dimensions: [140, 180],
        resize: {
          enable: true,
          max_size: [4,4],
          min_size: [1,1]
        }
    });
 
});

/*********************************/

/*
      var gridster;

      $(function(){

        gridster = $(".gridster ul").gridster({
          widget_base_dimensions: [100, 55],
          widget_margins: [0, 10],
          helper: 'clone',
          resize: {
            enabled: true,
            max_size: [4, 4],
            min_size: [1, 1]
          }
        }).data('gridster');


      });
*/
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