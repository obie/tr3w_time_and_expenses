$(function() {
  $("#update_draft_timesheets").bind("ajax:success", function(event, data) {
    $(data).each(function() {
      var td = $('#client_' + this.id + ' .draft_timesheets_count')
      td.html(this.draft_timesheets_count);
    });
  });
});
