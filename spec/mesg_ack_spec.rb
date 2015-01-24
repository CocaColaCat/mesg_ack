require 'mesg_ack'

describe MesgAck::MesgAck do

	it "should send ack" do
		MesgAck.setup do |config|
			config.api_url = "https://www.test.com/api/json"
			config.api_key = 'test_key'
		end
		Net::HTTP.any_instance.should_receive(:start)
 		MesgAck::MesgAck.send_ack('13811111111', 'send test message use') 
	end
end