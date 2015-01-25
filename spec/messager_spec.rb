require 'mesg_ack'
require 'webmock/rspec'

describe MesgAck::Messager do

	let(:test_api_url) { "https://www.test.com/api/json" }
	let(:test_api_key) { "test_key" }

	it "set dev mode" do	
		MesgAck.setup do |config|
			config.api_url = test_api_url
			config.api_key = test_api_key
			config.dev_mode = true
		end

 		expect(MesgAck::Messager.send_ack(nil, nil)).to eq('you are in dev mode') 
	end

	it "required telephone and message" do
		MesgAck.setup do |config|
			config.api_url = test_api_url
			config.api_key = test_api_key
			config.dev_mode = false
		end
 		expect(MesgAck::Messager.send_ack(nil, nil)).to eq('telephone and message are required') 
	end

	it "send" do
		telephone = '13811111111'
		message = 'hi'
		body =  {"message"=> message, "mobile"=> telephone }
		stub_request(:post, "https://api:#{test_api_key}@www.test.com/api/json").
         with(:body => body,
              :headers => {
              	'Accept'=>'*/*', 
              	'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
              	'Content-Type'=>'application/x-www-form-urlencoded', 
              	'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})

		MesgAck.setup do |config|
			config.api_url = test_api_url
			config.api_key = test_api_key
			config.dev_mode = false
		end

 		expect(MesgAck::Messager.send_ack(telephone, message)).to eq("200") 
	end

end