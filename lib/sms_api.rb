require "net/http"

class SmsApi
	def self.send(recipient,message)
	  uri = URI("http://ubaid.tk/sms/sms.aspx")
	  params = { uid: '9738733960',
	             pwd: 'P9333B',
	             phone: recipient,
	             msg: message,
	             provider: 'way2sms'
	          }
	  uri.query = URI.encode_www_form(params)
	  Net::HTTP.get_response(uri)
	end
end