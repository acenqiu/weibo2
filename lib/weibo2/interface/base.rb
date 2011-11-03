module Weibo2
  module Interface
    class Base
      def initialize(client)
        @client = client
      end
      
      def request(verb, path, opts={}, &block)
        unless @client.is_authorized?
          raise "I can't find a valid access_token. Forgot to get it or expired?"
        end
        
        response = @client.token.request(verb, path, opts, &block)
        if response.error
          raise Error.new(response)
        end
        response
      end
      
      def get(path, opts={}, &block)
        request(:get, path, opts, &block)
      end
      
      def post(path, opts={}, &block)
        request(:post, path, opts, &block)
      end
    end
    
  end
end
