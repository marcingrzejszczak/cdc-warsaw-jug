package contracts.beer.messaging

org.springframework.cloud.contract.spec.Contract.make {
	description("""
Sends a positive verification message when person is eligible to get the beer

given:
	client is too young
when:
	he applies for a beer
then:
	we'll send a message with a negative verification
""")
	// Label by means of which the output message can be triggered
	label 'accepted_verification'
	// input to the contract
	input {
		// the contract will be triggered by a method
		triggeredBy('clientIsTooYoung()')
	}
	// output message of the contract
	outputMessage {
		// destination to which the output message will be sent
		sentTo 'verifications'
		// the body of the output message
		body([
				eligible: false
		])
	}
}
