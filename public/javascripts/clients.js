$(function() {
  $("#update_client_details").bind("ajax:success", function(event, data) {
    $(data).each(function() {
      $('#client_'+ this.id +' .draft_timesheets_count').html(this.draft_timesheets_count);
    });
  });
});
