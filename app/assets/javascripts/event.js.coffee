$ ->
	campus_form = $("#campus-form")
	campus_form.css("display", "none")

	$("select#event_campus_id").change ->
  	if $(this).val() == "Create New..."
  		campus_form.css("display", "block")

	$("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
	    aler("here")
	    $("#content").html("<h1>SUCCESS</h1>")
