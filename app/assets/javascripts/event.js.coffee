$ ->
	
	$('select#event_campus_id').change -> 
		if $(this).val() == "Create New..."
			$.ajax '/campuses/new',
        type: 'GET'
        dataType: 'script'
        error: (jqXHR, textStatus, errorThrown) ->
            console.log "AJAX Error: #{textStatus}"
        