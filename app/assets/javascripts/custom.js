/* Toggle the hamburger menu */
function toggleHamburgerMenu() {
  var element = document.getElementById('Navbar');
  element.classList.toggle("mobile");
}

if( document.getElementById("HomePage") ) {
	console.log('Home');
	

	/* FB API  */
	function getUserData() {
	  FB.api('/me', {fields: 'first_name, last_name'}, function(response) {
	    $('#applicant_first_name').val(response.first_name);
	    $('#applicant_last_name').val(response.last_name);
	    console.log('getUserData', response);
	  });
	}
	/* Commented out to remove localhost error */
	window.fbAsyncInit = function() {
	  //SDK loaded, initialize it
	  FB.init({
	    appId      : '929935887215359',
	    xfbml      : true,
	    version    : 'v2.8'
	  });
	 console.log('fbAsyncInit');
	  //check user session and refresh it
	  FB.getLoginStatus(function(response) {
	    if (response.status === 'connected') {
	      //user is authorized
	      getUserData();
	    } else {
	      //user is not authorized
	      console.log('please log in');
	    }
	  });
	};
	 
	//load the JavaScript SDK
	(function(d, s, id){
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) {return;}
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.com/en_US/sdk.js";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	 
	//add event listener to login button
	document.getElementById('BtnFB').addEventListener('click', function(e) {
	  e.preventDefault();
	  //do the login
	  FB.login(function(response) {
	    if (response.authResponse) {
	      //user just authorized your app
	      getUserData();
	    }
	  }, {scope: 'email,public_profile', return_scopes: true});
	}, false);
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
