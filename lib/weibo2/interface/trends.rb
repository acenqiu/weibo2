# encoding: utf-8
module Weibo2
  module Interface
  
    # Trends API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E8.AF.9D.E9.A2.98
    class Trends < Base
      
      # 获取某人的话题列表
      #
      # @param [int64] uid 需要获取话题的用户的UID
      # @param [Hash] opts 
      # @option opts [int] :count 单页返回的记录条数，默认为10
      # @option opts [int] :page  返回结果的页码，默认为1
      # @see http://open.weibo.com/wiki/2/trends
      def trends(uid, opts={})
        get 'trends.json', :params => {:uid => uid}.merge(opts)
      end
      
      # 判断当前用户是否关注某话题
      #
      # @param [String] trend_name 话题关键字
      #
      # @see http://open.weibo.com/wiki/2/trends/is_follow
      def is_follow(trend_name)
        get 'trends/is_follow.json', :params => {:trend_name => trend_name}
      end
      
      # 返回最近一小时内的热门话题
      #
      # @param [Hash] opts 
      # @option opts [int] :base_app 是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0
      #
      # @see http://open.weibo.com/wiki/2/trends/hourly
      def hourly(opts={})
        get 'trends/hourly.json', :params => opts
      end
      
      # 返回最近一天内的热门话题
      #
      # @param [Hash] opts 
      # @option opts [int] :base_app 是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0
      #
      # @see http://open.weibo.com/wiki/2/trends/daily
      def daily(opts={})
        get 'trends/daily.json', :params => opts
      end
      
      # 返回最近一周内的热门话题
      #
      # @param [Hash] opts 
      # @option opts [int] :base_app 是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0
      #
      # @see http://open.weibo.com/wiki/2/trends/weekly
      def weekly(opts={})
        get 'trends/weekly.json', :params => opts
      end
      
      #
      # write
      #
      
      # 关注某话题
      #
      # @param [String] trend_name 要关注的话题关键词
      # @see http://open.weibo.com/wiki/2/trends/follow
      def follow(trend_name)
        post 'trends/follow.json', :body => {:trend_name => trend_name}
      end
      
      # 8485304 no pass
      # 取消对某话题的关注
      #
      # @param [int64] trend_id 要取消关注的话题ID
      #
      # @see http://open.weibo.com/wiki/2/trends/destroy
      def destroy(trend_id)
        post 'trends/destroy.json', :body => {:trend_id => trend_id}
      end
    end
  end
end
