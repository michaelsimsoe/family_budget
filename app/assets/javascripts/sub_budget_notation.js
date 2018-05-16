$(document).ready(function() {
	$(".sub_budget_notation").on("ajax:success", (event) =>
    [data, status, xhr] = event.detail
    $("#sub_budget_notation").append(xhr.responseText)
  ).on "ajax:error", (event) =>
    $("#sub_budget_notation").append("<p>ERROR</p>")
});