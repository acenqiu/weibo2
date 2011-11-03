# encoding: utf-8
module Weibo2
  module Interface
    
    # Users API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E7.94.A8.E6.88.B7
    class Users < Base
      
      # 根据用户ID获取用户信息
      #
      # @param [Hash] opts
      # @option opts [String] :uid         需要查询的用户ID
      # @option opts [String] :screen_name 需要查询的用户昵称
      #
      # @see http://open.weibo.com/wiki/2/users/show
      def show(opts={})
        get "users/show.json", :params => opts
      end
      
      # 通过个性化域名获取用户资料以及用户最新的一条微博
      #
      # @param [String] domain 需要查询的个性化域名
      #
      # @see http://open.weibo.com/wiki/2/users/domain_show
      def domain_show(domain)
        get "users/domain_show.json", :params => {:domain => domain}
      end
      
      # 批量获取用户的基本信息 [Privilege]
      #
      # @param [Hash] opts 
      # @option opts [String] :uids 需要查询的用户ID，用半角逗号分隔，一次最多20个
      # @option opts [String] :screen_name 需要查询的用户昵称，用半角逗号分隔，一次最多20个
      #
      # @see http://open.weibo.com/wiki/2/users/show_batch
      def show_batch(opts={})
        get "users/show_batch.json", :params => opts
      end
      
    end
  end
end
