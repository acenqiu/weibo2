module Weibo2
  module Strategy
    # The Authorization Code Strategy
    #
    # @see http://tools.ietf.org/html/draft-ietf-oauth-v2-15#section-4.1
    class AuthCode < OAuth2::Strategy::AuthCode
    
      # The authorization URL endpoint of the provider
      #
      # @param [Hash] params additional query parameters for the URL
      def authorize_url(params={})
        params = {:redirect_uri => @client.redirect_uri}.merge(params)
        super params
      end
      
      # Retrieve an access token given the specified validation code.
      #
      # @param [String] code The Authorization Code value
      # @param [Hash] params additional params
      # @param [Hash] opts options
      # @note that you must also provide a :redirect_uri with most OAuth 2.0 providers
      def get_token(code, params={}, opts={})
        params = {:redirect_uri => @client.redirect_uri}.merge(params)
        super(code, params, opts)
      end
    end
  end
end
