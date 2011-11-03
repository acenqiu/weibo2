# encoding: utf-8
module Weibo2
  module Interface
  
    # Comments API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E8.AF.84.E8.AE.BA
    class Comments < Base
      
      # 根据微博ID返回某条微博的评论列表
      #
      # @param [int64] id 需要查询的微博ID
      # @param [Hash] opts 
      # @option opts [int64] :since_id 若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0
      # @option opts [int64] :max_id   若指定此参数，则返回ID小于或等于max_id的评论，默认为0
      # @option opts [int] :count      单页返回的记录条数，默认为50 
      # @option opts [int] :page       返回结果的页码，默认为1
      # @option opts [int] :filter_by_author 作者筛选类型，0：全部、1：我关注的人、2：陌生人，默认为0
      #
      # @see http://open.weibo.com/wiki/2/comments/show
      def show(id, opts={})
        get 'comments/show.json', :params => {:id => id}.merge(opts)
      end
      
      # 获取当前登录用户所发出的评论列表
      #
      # @param [Hash] opts 
      # @option opts [int64] :since_id 若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0
      # @option opts [int64] :max_id   若指定此参数，则返回ID小于或等于max_id的评论，默认为0
      # @option opts [int] :count      单页返回的记录条数，默认为50 
      # @option opts [int] :page       返回结果的页码，默认为1
      # @option opts [int] :filter_by_source 来源筛选类型，0：全部、1：来自微博的评论、2：来自微群的评论，默认为0
      #
      # @see http://open.weibo.com/wiki/2/comments/by_me
      def by_me(opts={})
        get 'comments/by_me.json', :params => opts
      end
      
      # 获取当前登录用户所接收到的评论列表
      #
      # @param [Hash] opts 
      # @option opts [int64] :since_id 若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0
      # @option opts [int64] :max_id   若指定此参数，则返回ID小于或等于max_id的评论，默认为0
      # @option opts [int] :count      单页返回的记录条数，默认为50 
      # @option opts [int] :page       返回结果的页码，默认为1
      # @option opts [int] :filter_by_author 作者筛选类型，0：全部、1：我关注的人、2：陌生人，默认为0
      # @option opts [int] :filter_by_source 来源筛选类型，0：全部、1：来自微博的评论、2：来自微群的评论，默认为0
      #
      # @see http://open.weibo.com/wiki/2/comments/to_me
      def to_me(opts={})
        get 'comments/to_me.json', :params => opts
      end
      
      # 获取当前登录用户的最新评论包括接收到的与发出的
      #
      # @param [Hash] opts 
      # @option opts [int64] :since_id 若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0
      # @option opts [int64] :max_id   若指定此参数，则返回ID小于或等于max_id的评论，默认为0
      # @option opts [int] :count      单页返回的记录条数，默认为50 
      # @option opts [int] :page       返回结果的页码，默认为1
      #
      # @see http://open.weibo.com/wiki/2/comments/timeline
      def timeline(opts={})
        get 'comments/timeline.json', :params => opts
      end
      
      # 获取最新的提到当前登录用户的评论，即@我的评论
      #
      # @param [Hash] opts 
      # @option opts [int64] :since_id 若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0
      # @option opts [int64] :max_id   若指定此参数，则返回ID小于或等于max_id的评论，默认为0
      # @option opts [int] :count      单页返回的记录条数，默认为50 
      # @option opts [int] :page       返回结果的页码，默认为1
      # @option opts [int] :filter_by_author 作者筛选类型，0：全部、1：我关注的人、2：陌生人，默认为0
      # @option opts [int] :filter_by_source 来源筛选类型，0：全部、1：来自微博的评论、2：来自微群的评论，默认为0
      #
      # @see http://open.weibo.com/wiki/2/comments/mentions
      def mentions(opts={})
        get 'comments/mentions.json', :params => opts
      end
      
      # 根据评论ID批量返回评论信息
      #
      # @param [String] cids 需要查询的批量评论ID，用半角逗号分隔，最大50
      #
      # @see http://open.weibo.com/wiki/2/comments/show_batch
      def show_batch(cids)
        get 'comments/show_batch.json', :params => {:cids => cids}
      end
      
      #
      # write
      #
      
      # 对一条微博进行评论
      #
      # @param [String] comment 评论内容，内容不超过140个汉字
      # @param [int64] id       需要评论的微博ID
      # @param [Hash] opts 
      # @option opts [int] :comment_on 当评论转发微博时，是否评论给原微博，0：否、1：是，默认为0
      #
      # @see http://open.weibo.com/wiki/2/comments/create
      def create(comment, id)
        post 'comments/create.json', :body => {:comment => comment, :id => id}
      end
      
      # no test
      # 删除一条评论
      #
      # @param [int64] cid 要删除的评论ID，只能删除登录用户自己发布的评论
      #
      # @see http://open.weibo.com/wiki/2/comments/destroy
      def destroy(cid)
        post 'comments/destroy.json', :body => {:cid => cid}
      end
      
      # 根据评论ID批量删除评论
      #
      # @param [String] cids 需要删除的评论ID，用半角逗号隔开，最多20个
      #
      # @see http://open.weibo.com/wiki/2/comments/destroy_batch
      def destroy_batch(cids)
        post 'comments/destroy_batch.json', :body => {:cids => cids}
      end
      
      # no test
      # 回复一条评论
      #
      # @param [int64] cid 需要回复的评论ID
      # @param [int64] id  需要评论的微博ID
      # @param [String] comment 回复评论内容，内容不超过140个汉字
      # @param [Hash] opts 
      # @option opts [int] :without_mention 回复中是否自动加入“回复@用户名”，0：是、1：否，默认为0
      # @option opts [int] :comment_on      当评论转发微博时，是否评论给原微博，0：否、1：是，默认为0
      #
      # @see http://open.weibo.com/wiki/2/comments/reply
      def reply(cid, id, comment, opts={})
        post 'comments/reply.json', :body => {:cid => cid, :id => id, :comment => comment}.merge(opts)
      end
    
    end  
  end
end
