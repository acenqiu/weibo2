# encoding: utf-8
module Weibo2
  module Interface
  
    # Suggestions API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E6.8E.A8.E8.8D.90
    class Suggestions < Base
    
      # 返回系统推荐的热门用户列表
      #
      # @param [Hash] opts
      # @option opts [String] :category 推荐分类，返回某一类别的推荐用户
      #
      # @see http://open.weibo.com/wiki/2/suggestions/users/hot
      def users_hot(opts={})
        get 'suggestions/users/hot.json', :params => opts
      end
      
      # 获取用户可能感兴趣的人
      #
      # @param [Hash] opts
      # @option opts [int] :count 单页返回的记录条数，默认为10
      # @option opts [int] :page  返回结果的页码，默认为1
      #
      # @see http://open.weibo.com/wiki/2/suggestions/users/may_interested
      def users_may_interested(opts={})
        get 'suggestions/users/may_interested.json', :params => opts
      end
      
      # 根据一段微博正文推荐相关微博用户
      #
      # @param [String] content 微博正文内容
      # @param [Hash]   opts
      # @option opts [int] :num 返回结果数目，默认为10
      #
      # @see http://open.weibo.com/wiki/2/suggestions/users/by_status
      def users_by_status(content, opts={})
        get 'suggestions/users/by_status.json', :params => {:content => content}.merge(opts)
      end
      
      # 返回系统推荐的热门收藏
      #
      # @param [Hash] opts
      # @option opts [int] :count 每页返回结果数，默认20
      # @option opts [int] :page  返回页码，默认1
      #
      # @see http://open.weibo.com/wiki/2/suggestions/favorites/hot
      def favorites_hot(opts={})
        get 'suggestions/favorites/hot.json', :params => opts
      end
      
      
      #
      # write
      #
      
      # 把某人标识为不感兴趣的人
      #
      # @param [int64] uid 不感兴趣的用户的UID
      #
      # @see http://open.weibo.com/wiki/2/suggestions/users/not_interested
      def users_not_interested(uid)
        post 'suggestions/users/not_interested.json', :body => {:uid => uid}
      end
      
    end
  end
end
