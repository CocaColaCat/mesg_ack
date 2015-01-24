require 'mesg_ack'

describe MesgAck::Messager do

	it "set dev mode" do
		
		MesgAck.setup do |config|
			config.api_url = "https://www.test.com/api/json"
			config.api_key = 'test_key'
			config.dev_mode = true
		end

 		expect(MesgAck::Messager.send_ack(nil, nil)).to eq('you are in dev mode') 
	end
end