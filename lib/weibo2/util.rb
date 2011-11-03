module Weibo2
  class Util
    
    class << self
      
      def is_authorized?
        
      end
  
      def parse_signed_request(signed_request, secret)
        encoded_sig, payload = signed_request.split('.')
        sig = base64decode(encoded_sig)
        data = JSON.parse base64decode(payload)
        return "-1" if data['algorithm'].upcase != "HMAC-SHA256"
        
        digest = OpenSSL::Digest.new("SHA256")
        expected_sig = OpenSSL::HMAC.digest(digest, secret, payload)
        (sig != expected_sig) ? "-2" : data
      end
      
      private
    
        def base64decode(str)
          (4 - str.length % 4).times {|i| str += "="}
          str = str.gsub('-', '+').gsub('_', '/')
          Base64.decode64(str)
        end
    end
  end
end
