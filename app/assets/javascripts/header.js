$(function() {
  $(".fade > li").hover(
    function() {
      $(this)
        .find(".secondary_nav")
        .stop(true)
        .fadeIn(500);
    },
    function() {
      $(this)
        .find(".secondary_nav")
        .fadeOut(500);
    }
  );
});