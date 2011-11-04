module Weibo2
  module Strategy
    class SignedRequest < OAuth2::Strategy::Base
      attr_reader :unsigned_request
    
      # Not used for this strategy
      #
      # @raise [NotImplementedError]
      def authorize_url
        raise NotImplementedError, "The authorization endpoint is not used in this strategy"
      end
      
      # Retrieve an access token given the specified signed_request.
      #
      # @param [String] signed_request
      def get_token(signed_request)
        data = parse_signed_request(signed_request)
        unless ["-1", "-2"].include? data
          @unsigned_request = data
          @client.get_token_from_hash(data)
        end
      end
      
      private
      
        # parsing the signed_request to a hash
        #
        # @param [String] signed_request 
        # @return [Hash] a hash if no error occured
        #         [String] "-1" for algorithm mismatch, "-2" for wrong signature
        def parse_signed_request(signed_request)
          encoded_sig, payload = signed_request.split('.')
          sig = base64decode(encoded_sig)
          data = JSON.parse base64decode(payload)
          return "-1" if data['algorithm'].upcase != "HMAC-SHA256"
          
          digest = OpenSSL::Digest.new("SHA256")
          expected_sig = OpenSSL::HMAC.digest(digest, @client.secret, payload)
          (sig != expected_sig) ? "-2" : data
        end
    
        def base64decode(str)
          (4 - str.length % 4).times {|i| str += "="}
          str = str.gsub('-', '+').gsub('_', '/')
          Base64.decode64(str)
        end
    end
  end
end
