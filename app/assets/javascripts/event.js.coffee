$ -> 
		$('select#event_campus_id').change -> 
			if $(this).val() == "Create New..." 
				if $('#form-campus').length > 0
					$('#form-campus').dialog('open')
				else 
					$.ajax '/campuses/new',
		        type: 'GET'
		        dataType: 'script'
		        error: (jqXHR, textStatus, errorThrown) ->
		          console.log "AJAX Error: #{textStatus}: #{errorThrown}" 