$ ->
	$("select#event_campus_id").change ->
  	console.log($(this).val())
  	if $(this).val() == "Create New..."
  		console.log("SHOW CAMPUS FORM!")
