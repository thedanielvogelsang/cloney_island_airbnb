$(document).ready(function() {

  $('.dropbtn').click(function() {
    event.preventDefault();
  });
  
  $('.host-dropdown').hover(
    function() {
      $('.dropdown-content').addClass('show');
    }, function() {
      $('.dropdown-content').removeClass('show');
    }
  );

})
