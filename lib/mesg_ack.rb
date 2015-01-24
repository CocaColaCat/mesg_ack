require "mesg_ack/version"
require "mesg_ack/mesg_ack"
require 'net/http'
require "uri"

module MesgAck

	class << self
		attr_accessor :api_key 
		attr_accessor :api_url 

	  def setup
    	yield self
  	end
	end

end
