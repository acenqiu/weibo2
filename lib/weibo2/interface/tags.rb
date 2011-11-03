# encoding: utf-8
module Weibo2
  module Interface
    
    # Tags API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E6.A0.87.E7.AD.BE
    class Tags < Base
    
      # 返回指定用户的标签列表
      #
      # @param [int64] uid 要获取的标签列表所属的用户ID
      # @param [Hash] opts
      # @option opts [int] :count 单页返回的记录条数，默认为20
      # @option opts [int] :page  返回结果的页码，默认为1
      # @see http://open.weibo.com/wiki/2/tags
      def tags(uid, opts={})
        get 'tags.json', :params => {:uid => uid}.merge(opts)
      end
      
      # 批量获取用户的标签列表
      #
      # @param [String] uids 要获取标签的用户ID。最大20，逗号分隔
      #
      # @see http://open.weibo.com/wiki/2/tags/tags_batch
      def tags_batch(uids)
        get 'tags/tags_batch.json', :params => {:uids => uids}
      end  
      
      # 获取系统推荐的标签列表
      #
      # @param [Hash] opts
      # @option opts [int] :count 返回记录数，默认10，最大10
      #
      # @see http://open.weibo.com/wiki/2/tags/suggestions
      def suggestions(opts={})
        get 'tags/suggestions.json', :params => opts
      end
      
      #
      # write
      #
      
      # 为当前登录用户添加新的用户标签
      #
      # @param [String] tags 要创建的一组标签，用半角逗号隔开，每个标签的长度不可超过7个汉字，14个半角字符
      #
      # @see http://open.weibo.com/wiki/2/tags/create
      def create(tags)
        post 'tags/create.json', :body => {:tags => tags}
      end
      
      # 删除一个用户标签
      #
      # @param [int64] tag_id 要删除的标签ID
      #
      # @see http://open.weibo.com/wiki/2/tags/destroy
      def destroy(tag_id)
        post 'tags/destroy.json', :body => {:tag_id => tag_id}
      end
      
      # 批量删除一组标签
      #
      # @param [String] ids 要删除的一组标签ID，以半角逗号隔开，一次最多提交10个ID
      #
      def destroy_batch(ids)
        post 'tags/destroy_batch.json', :body => {:ids => ids}
      end
    end
  end
end
