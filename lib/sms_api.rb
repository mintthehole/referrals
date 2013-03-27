require "net/http"

class SmsApi
	def self.send(recipient,message)
	  uri = URI("http://ubaid.tk/sms/sms.aspx")
	  params = { uid: '9985098108',
	             pwd: 'whoisit1',
	             phone: recipient,
	             msg: message,
	             provider: 'way2sms'
	          }
	  uri.query = URI.encode_www_form(params)
	  Net::HTTP.get_response(uri)
	end
	Exotel.configure do |c|
  c.exotel_sid   = 'strata'
	c.exotel_token = 'e775799e17c3d67b5c1f8eaa66db07d570a50c82'
	end

end