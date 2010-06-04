$(function() {
  $("#update_draft_timesheets").bind("ajax:success", function(event, data) {
    // assumes JSON is the repsonse content type
    $(data).each(function() {
      var td = $('#client_' + this.id + ' .draft_timesheets_count')
      td.html(this.draft_timesheets_count);
    });
  });
});
