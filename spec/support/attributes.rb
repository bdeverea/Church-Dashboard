def service_attributes (overrides = {})
	{
		name: 'Saturday 5pm Service',
		description: 'This is the Saturday evening service at 5pm'
	}.merge(overrides)
end 

def campus_attributes (overrides = {})
	{
		name: 'Chelmsford - Mill Building',
		address1: '68 Princeton Street',
		address2: '',
		city: 'North Chelmsford',
		state: 'MA',
		postal_code: '01863',
		phone: '9782513999'
	}.merge(overrides)
end

def event_attributes (overrides = {})
	{

	}
end

