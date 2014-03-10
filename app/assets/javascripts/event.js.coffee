showModal = -> 
		console.log("A link: " + $('#create_campus'))
		$('#create_campus').click ->
			preventDefault()
			console.log("Linked clicked!")
		
		

showModal()