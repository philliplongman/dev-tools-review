$(".comment-toggle").click(function() {
  $(this).closest(".review").find(".comment-div").slideToggle("slow");
});
