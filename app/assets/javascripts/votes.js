$(".upvote").click(function(e) {
  e.preventDefault();
  var $this = $(this);
  var reviewId = $this.attr("review-id");
  var userId = $this.attr("user-id");

  $.ajax({
        method: "POST",
        url: "/reviews/" + reviewId + "/votes",
        dataType: "json",
        data: { vote: {
          userId: userId, state: "upvote", reviewId: reviewId
        } }
      }).done(function(resp) {
        var div = $this.parent();
        div.find( "#vote-count-" + reviewId ).html(resp.voteCount);
       });
});

$(".downvote").click(function(e) {
  e.preventDefault();
  var $this = $(this);
  var reviewId = $this.attr("review-id");
  var userId = $this.attr("user-id");

  $.ajax({
        method: "POST",
        url: "/reviews/" + reviewId + "/votes",
        dataType: "json",
        data: { vote: {
          userId: userId, state: "downvote", reviewId: reviewId
        } }
      }).done(function(resp) {
         var div = $this.parent();
         div.find( "#vote-count-" + reviewId ).html(resp.voteCount);
       });
});
