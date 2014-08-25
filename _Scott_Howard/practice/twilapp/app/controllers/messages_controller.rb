class MessagesController < ApplicationController
	require 'twilio-ruby' 
 
	# put your own credentials here 
	account_sid = 'ACfa7829c4a3764cfb80ed796e5b783206' 
	auth_token = 'be980eb2a7e227dcf185ae23f380b425' 
	 
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.messages.create({
		:from => '+14342645060', 
		:to => '+18043879208', 
		:body => 'testtesttest',  
	})

end
