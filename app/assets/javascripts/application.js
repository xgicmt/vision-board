//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

//Loading Graphic
  $(document).ready(function(){
    $('#addImage').click(function(){
      $('.topLoader').slideDown("slow");
    })
});

//Gridster, with resize
  $(function(){ //DOM Ready
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
//Drag and Drop 
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

  // var board_id = <%= @board.id %>;
   var image_id = data;

    document.location.href = '/images/show?image_id='+image_id+'&board_id='+board_id;
  }