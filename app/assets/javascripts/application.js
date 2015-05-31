//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
$(function(){ 
  $('.flash:visible').delay(1500).slideUp();
});
  $(document).ready(function(){
    $('#addImage').click(function(){
      $('.topLoader').slideDown("slow");
    })
  });
  $(function(){ 
    $(".gridster ul").gridster({
        widget_margins: [0, 10],
        widget_base_dimensions: [140, 180],
        resize: {
          enabled: true,
          max_size: [4,4],
          min_size: [1,1]
        }
    });
  });
  function show_shared(div_id){
    if(false == $(div_id).is(':visible')){
      $(div_id).show(500);
    }
    else{
      $(div_id).hide(500);
    }
  }

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
    var image_id = data;
    document.location.href = '/images/show?image_id='+image_id+'&board_id='+board_id;
  }