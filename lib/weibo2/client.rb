require 'oauth2'

module Weibo2

  # The Weibo2::Client class
  class Client
  
    attr_reader :key, :secret, :redirect_uri
    attr_accessor :client, :token
    
    def self.from_signed_request(signed_request, opts={}, &block)
      client = self.new(opts, &block)
      client.get_token_from_signed_request(signed_request)
      
      client
    end

    # 
    def initialize(opts={}, &block)
      @key = Weibo2::Config.api_key
      @secret = Weibo2::Config.api_secret
      @redirect_uri = Weibo2::Config.redirect_uri
      
      options = {:site          => "https://api.weibo.com/2/",
                 :authorize_url => "oauth2/authorize",
                 :token_url     => "oauth2/access_token",
                 :raise_errors  => false,
                 :ssl           => {:verify => false}}.merge(opts)
          
      @client = OAuth2::Client.new(@key, @secret, options, &block)
    end
    
    def authorize_url(params={})
      client.auth_code.authorize_url({:redirect_uri => redirect_uri}.merge(params))
    end
    
    def get_token(code, params={})
      @token = client.auth_code.get_token(code, {:redirect_uri => redirect_uri, :parse => :json}.merge(params), {:header_format => "OAuth2 %s"})
    end
    
    def get_token_from_signed_request(signed_request)
      data = Weibo2::Util.parse_signed_request(signed_request, secret)
      puts data.inspect
      unless ["-1", "-2"].include? data
        opts = {:expires_at => data["expires"], 
                :header_format => "OAuth2 %s"}
        @token = OAuth2::AccessToken.new(client, data["oauth_token"], opts)
      end
    end
    
    
    def account
      @account ||= Weibo2::Interface::Account.new(self)
    end
    
    def comments
      @comments ||= Weibo2::Interface::Comments.new(self)
    end
    
    def favorites
      @favorites ||= Weibo2::Interface::Favorites.new(self)
    end
    
    def friendships
      @friendships ||= Weibo2::Interface::Friendships.new(self)
    end
    
    def register
      @register ||= Weibo2::Interface::Register.new(self)
    end
    
    def search
      @search ||= Weibo2::Interface::Search.new(self)
    end
    
    def statuses
      @statuses ||= Weibo2::Interface::Statuses.new(self)
    end
    
    def suggestions
      @suggestions ||= Weibo2::Interface::Suggestions.new(self)
    end
    
    def tags
      @tags ||= Weibo2::Interface::Tags.new(self)
    end
    
    def trends
      @trends ||= Weibo2::Interface::Trends.new(self)
    end
    
    def users
      @users ||= Weibo2::Interface::Users.new(self)
    end
  end
end
