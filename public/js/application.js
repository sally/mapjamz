$(document).ready(function(){
  locationFormSubmitListener('#location-form');

  });


function locationFormSubmitListener(formId){
  $(formId).on('submit', function(){
    event.preventDefault();

    var locationForm = $(this);
    var address = locationForm.attr('action');
    var method = locationForm.attr('method');
    var locationInput = locationForm.serialize();

    var request0 = $.ajax({
      url: address,
      method: method,
      data: locationInput
    });

    request0.done(function(response){
      console.log(response);
    });

    var request1 = $.ajax({
      url: '/tracks',
      method: 'POST',
      data: locationInput
    });

    request1.done(function(response){
      console.log(response)
    });

    var request2 = $.ajax({
      url: '/locations/coordinates',
      method: 'POST',
      data: locationInput
    });

    request2.done(function(response){
      // var parsed_response = $.parseJSON(response);

      // console.log(response);

      $('#map-container').empty();

      $('#map-container').append(response);

      console.log(document.getElementById("map-bg").innerHTML);

      eval(document.getElementById("map-bg").innerHTML);
      eval(document.getElementById("map-bg-async").innerHTML);
    });
  })
}