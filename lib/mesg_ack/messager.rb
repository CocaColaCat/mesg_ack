class MesgAck::Messager

	def self.send_ack(telephone, message)
		return "you are in dev mode" if MesgAck.dev_mode
		return "telephone and message are required" if telephone.nil? || message.nil? 
		send(telephone, message)
	end

	private
	def self.send(telephone, message)
		uri = URI.parse(MesgAck.api_url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		request = Net::HTTP::Post.new(uri.request_uri)
		request.basic_auth("api", MesgAck.api_key)
		request.set_form_data( { "mobile" => telephone, "message" => message } )
		resp = http.start { |http| http.request(request) }
		return resp.code
	end

end