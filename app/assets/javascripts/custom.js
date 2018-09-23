/* Toggle the hamburger menu */
function toggleHamburgerMenu() {
  var element = document.getElementById('Navbar');
  element.classList.toggle("mobile");
}

/* Jquery stuff */
$(function(){
  
  /* Toggle ajax loader */
  $( "form" ).submit(function( ) {
    console.log('submitted');
    $('.ajax-loader').show();
  });
  if ($(".alert").text().length > 0){
    $('.ajax-loader').hide();
  }


  /* Function which adds the 'animated' class to any '.animatable' in view */
  var doAnimations = function() {
    // Calc current offset and get all animatables
    var offset = $(window).scrollTop() + $(window).height(),
        $animatables = $('.animatable');
    // Unbind scroll handler if we have no animatables
    if ($animatables.length == 0) {
      $(window).off('scroll', doAnimations);
    }
    
    // Check all animatables and animate them if necessary
    $animatables.each(function(i) {
       var $animatable = $(this);
      if (($animatable.offset().top) < offset) {
        $animatable.removeClass('animatable').addClass('animated');
      }
    });

  };
  // Hook doAnimations on scroll, and trigger a scroll
  $(window).on('scroll', doAnimations);
  $(window).trigger('scroll');
});
