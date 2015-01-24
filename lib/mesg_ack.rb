require "mesg_ack/version"
require "mesg_ack/messager"
require 'net/http'
require "uri"

module MesgAck

	class << self
		attr_accessor :api_key 
		attr_accessor :api_url 
		attr_accessor :dev_mode

	  def setup
    	yield self
  	end
	end

end
