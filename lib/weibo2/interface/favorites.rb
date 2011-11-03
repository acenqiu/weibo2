# encoding: utf-8
module Weibo2
  module Interface
  
    # Favorites API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E6.94.B6.E8.97.8F
    class Favorites < Base
      
      # 获取当前登录用户的收藏列表 
      #
      # @param [Hash] opts
      # @option opts [int] :count 单页返回的记录条数，默认为50
      # @option opts [int] :page  返回结果的页码，默认为1
      #
      # @see http://open.weibo.com/wiki/2/favorites
      def favorites(opts={})
        get 'favorites.json', :params => opts
      end
      
      # 根据收藏ID获取指定的收藏信息
      #
      # @param [int64] id 需要查询的收藏ID
      #
      # @see http://open.weibo.com/wiki/2/favorites/show
      def show(id)
        get 'favorites/show.json', :params => {:id => id}
      end
      
      # 根据标签获取当前登录用户该标签下的收藏列表 
      # 
      # @param [int64] tid 需要查询的标签ID
      # @param [Hash] opts 
      # @option opts [int] :count 单页返回的记录条数，默认为50
      # @option opts [int] :page  返回结果的页码，默认为1
      #
      # @see http://open.weibo.com/wiki/2/favorites/by_tags
      def by_tags(tid, opts={})
        get 'favorites/by_tags.json', :params => {:tid => tid}.merge(opts)
      end
      
      # 获取当前登录用户的收藏标签列表
      #
      # @param [Hash] opts
      # @option opts [int] :count 单页返回的记录条数，默认为10
      # @option opts [int] :page  返回结果的页码，默认为1
      #
      # @see http://open.weibo.com/wiki/2/favorites/tags
      def tags(opts={})
        get 'favorites/tags.json', :params => opts
      end
      
      #
      # write
      #
      
      #test no pass below
      # 添加一条微博到收藏里
      #
      # @param [int64] id 要收藏的微博ID
      #
      # @see http://open.weibo.com/wiki/2/favorites/create
      def create(id)
        post 'favorites/create.json', :body => {:id => id}
      end
      
      # 取消收藏一条微博
      #
      # @param [int64] id 要取消收藏的微博ID
      #
      # @see http://open.weibo.com/wiki/2/favorites/destroy
      def destroy(id)
        post 'favorites/destroy.json', :body => {:id => id}
      end
      
      # 根据收藏ID批量取消收藏
      #
      # @param [String] ids 要取消收藏的收藏ID，用半角逗号分隔，最多不超过10个
      # @see http://open.weibo.com/wiki/2/favorites/destroy_batch
      def destroy_batch(ids)
        post 'favorites/destroy_batch.json', :body => {:ids => ids}
      end
      
      # 更新一条收藏的收藏标签
      #
      # @param [int64] id 需要更新的收藏ID
      # @param [Hash] opts 
      # @option opts [String] :tags 需要更新的标签内容，用半角逗号分隔，最多不超过2条
      #
      # @see http://open.weibo.com/wiki/2/favorites/tags/update
      def tags_update(id, opt={})
        post 'favorites/tags/update.json', :body => {:id => id}.merge(opts)
      end
      
      # 更新当前登录用户所有收藏下的指定标签
      #
      # @param [int64] tid  需要更新的标签ID
      # @param [String] tag 需要更新的标签内容
      # @see http://open.weibo.com/wiki/2/favorites/tags/update_batch
      def tags_update_batch(tid, tag)
        post 'favorites/tags/update_batch.json', :body => {:tid => tid, :tag => tag}
      end
      
      # 删除当前登录用户所有收藏下的指定标签
      #
      # @param [int64] tid 需要删除的标签ID
      #
      # @see http://open.weibo.com/wiki/2/favorites/tags/destroy_batch
      def tags_destroy_batch(tid)
        post 'favorites/tags/destroy_batch.json', :body => {:tid => tid}
      end
    end
  end
end
