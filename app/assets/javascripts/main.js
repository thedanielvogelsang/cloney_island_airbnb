$(document).ready(function() {

  $('.dropbtn').click(function() {
    event.preventDefault();
  });

  $('.host-dropdown').hover(
    function() {
      $('.host-dropdown-content').addClass('show');
    }, function() {
      $('.host-dropdown-content').removeClass('show');
    }
  );

  $('.signin-dropdown').hover(
    function() {
      $('.signin-dropdown-content').addClass('show');
    }, function() {
      $('.signin-dropdown-content').removeClass('show');
    }
  );

})
