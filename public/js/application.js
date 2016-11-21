$(document).ready(function(){
  // loginLinkListener('header');
  locationFormSubmitListener('#main-container');
  imgClickListener('#tracks-container')
  });

// function loginLinkListener(headerTag){
//   $(headerTag).on('click', "a", function(){
//     event.preventDefault();

//   })
// }


function locationFormSubmitListener(mainContainerId){
  $(mainContainerId).on('click', "#location-submit", function(){
    event.preventDefault();

    var locationForm = $(this).parent();
    var address = locationForm.attr('action');
    var method = locationForm.attr('method');
    var locationInput = locationForm.serialize();

    if ($('#index-form-container')) {
      $('#index-form-container').remove();
      $('#form-header').append(locationForm);
    }

    var request0 = $.ajax({
      url: address,
      method: method,
      data: locationInput
    });

    request0.done(function(response){
      $('#tracks-container').empty();
      $('#tracks-container').append(response);
    });

    request0.fail(function(response){
      $('#tracks-container').empty();
      $('#tracks-container').append("No tracks found!");
    });

    var request1 = $.ajax({
      url: '/locations/coordinates',
      method: 'POST',
      data: locationInput
    });

    request1.done(function(response){
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

function imgClickListener(tracksContainerId){
  $(tracksContainerId).on('click', ".thumbnail", function(event){
    event.preventDefault();

    trackId = $(this).attr('id')

    var request = $.ajax({
      url: 'tracks/' + trackId,
      method: 'GET'
    })

    request.done(function(response){
      // $('#summary' + trackId).append(response);
      // $('#summary' + trackId).slideToggle();

      $('#summary' + trackId).toggleClass('active').empty().append(response);
    })
  })
}

// function locationFormSubmitListener(formId){
//   $(formId).on('submit', function(){
//     event.preventDefault();

//     var locationForm = $(this);
//     var address = locationForm.attr('action');
//     var method = locationForm.attr('method');
//     var locationInput = locationForm.serialize();

//     if ($('#index-form-container')) {
//       $('#index-form-container').remove();
//       $('#form-header').append(this);
//     }

//     var request0 = $.ajax({
//       url: address,
//       method: method,
//       data: locationInput
//     });

//     request0.done(function(response){
//       $('#tracks-container').empty();
//       $('#tracks-container').append(response);
//     });

//     request0.fail(function(response){
//       $('#tracks-container').empty();
//       $('#tracks-container').append("No tracks found!");
//     });

//     var request1 = $.ajax({
//       url: '/locations/coordinates',
//       method: 'POST',
//       data: locationInput
//     });

//     request1.done(function(response){
//       // var parsed_response = $.parseJSON(response);

//       // console.log(response);

//       $('#map-container').empty();

//       $('#map-container').append(response);

//       console.log(document.getElementById("map-bg").innerHTML);

//       eval(document.getElementById("map-bg").innerHTML);
//       eval(document.getElementById("map-bg-async").innerHTML);
//     });
//   })
// }
