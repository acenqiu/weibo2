module Weibo2
  class Error < OAuth2::Error
  
    def initialize(response)
      response.error = self
      @response = response
      if response.parsed.is_a?(Hash)
        @code = response.parsed['error_code']
        @description = response.parsed['error']
      end
    end
  end
end
