# encoding: utf-8
module Weibo2
  module Interface
    
    # Friendships API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E5.85.B3.E7.B3.BB
    class Friendships < Base
    
      # 获取用户的关注列表
      #
      # @param [Hash] opts 
      # @option opts [int64] :uid  需要查询的用户UID
      # @option opts [String] :screen_name 需要查询的用户昵称
      # @option opts [int] :count  单页返回的记录条数，默认为50，最大不超过200
      # @option opts [int] :cursor 返回结果的游标，下一页用返回值里的next_cursor，上一页用previous_cursor，默认为0
      #
      # @see http://open.weibo.com/wiki/2/friendships/friends
      def friends(opts={})
        get 'friendships/friends.json', :params => opts
      end
      
      # 获取两个用户之间的共同关注人列表
      #
      # @param [int64] uid 需要获取共同关注关系的用户UID
      # @param [Hash] opts 
      # @option opts [int64] :suid 需要获取共同关注关系的用户UID，默认为当前登录用户
      # @option opts [int] :count  单页返回的记录条数，默认为50
      # @option opts [int] :page   返回结果的页码，默认为1
      #
      # @see http://open.weibo.com/wiki/2/friendships/friends/in_common
      def friends_in_common(uid, opts={})
        get 'friendships/friends/in_common.json', :params => {:uid => uid}.merge(opts)
      end
      
      # 获取用户的双向关注列表，即互粉列表
      #
      # @param [int64] uid 需要获取双向关注列表的用户UID
      # @param [Hash] opts 
      # @option opts [int] :count 单页返回的记录条数，默认为50
      # @option opts [int] :page  返回结果的页码，默认为1
      # @option opts [int] :sort  排序类型，0：按关注时间最近排序，默认为0
      #
      # @see http://open.weibo.com/wiki/2/friendships/friends/bilateral
      def friends_bilateral(uid, opts={})
        get 'friendships/friends/bilateral.json', :params => {:uid => uid}.merge(opts)
      end
      
      # 获取用户双向关注的用户ID列表，即互粉UID列表
      #
      # @param [int64] uid 需要获取双向关注列表的用户UID
      # @param [Hash] opts 
      # @option opts [int] :count 单页返回的记录条数，默认为50，最大不超过2000
      # @option opts [int] :page  返回结果的页码，默认为1
      # @option opts [int] :sort  排序类型，0：按关注时间最近排序，默认为0
      #
      # @see http://open.weibo.com/wiki/2/friendships/friends/bilateral/ids
      def friends_bilateral_ids(uid, opts={})
        get 'friendships/friends/bilateral/ids.json', :params => {:uid => uid}.merge(opts)
      end    
      
      # 获取用户关注的用户UID列表
      #
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要查询的用户UID
      # @option opts [String] :screen_name 需要查询的用户昵称
      # @option opts [int] :count  单页返回的记录条数，默认为500，最大不超过5000
      # @option opts [int] :cursor 返回结果的游标，下一页用返回值里的next_cursor，上一页用previous_cursor，默认为0 
      #
      # @see http://open.weibo.com/wiki/2/friendships/friends/ids
      def friends_ids(opts={})
        get 'friendships/friends/ids.json', :params => opts
      end
      
      # 批量获取当前登录用户的关注人的备注信息 [Privilege]
      #
      # @param [String] uids 需要获取备注的用户UID，用半角逗号分隔，最多不超过50个
      #
      # @see http://open.weibo.com/wiki/2/friendships/friends/remark_batch
      def friends_remark_batch(uids)
        get 'friendships/friends/remark_batch.json', :params => {:uids => uids}
      end
      
      # 获取用户的粉丝列表
      #
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要查询的用户UID
      # @option opts [String] :screen_name 需要查询的用户昵称
      # @option opts [int] :count  单页返回的记录条数，默认为50，最大不超过200
      # @option opts [int] :cursor 返回结果的游标，下一页用返回值里的next_cursor，上一页用previous_cursor，默认为0
      #
      # @see http://open.weibo.com/wiki/2/friendships/followers
      def followers(opts={})
        get 'friendships/followers.json', :params => opts
      end
      
      # 获取用户粉丝的用户UID列表
      #
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要查询的用户UID
      # @option opts [String] :screen_name 需要查询的用户昵称
      # @option opts [int] :count  单页返回的记录条数，默认为500，最大不超过5000
      # @option opts [int] :cursor 返回结果的游标，下一页用返回值里的next_cursor，上一页用previous_cursor，默认为0
      #
      # @see http://open.weibo.com/wiki/2/friendships/followers/ids
      def followers_ids(opts={})
        get 'friendships/followers/ids.json', :params => opts
      end
      
      # 获取用户的活跃粉丝列表
      # @param [int64] uid 需要查询的用户UID
      # @param [Hash] opts 
      # @option opts [int] :count 返回的记录条数，默认为20，最大不超过200
      #
      # @see http://open.weibo.com/wiki/2/friendships/followers/active
      def followers_active(uid, opts={})
        get 'friendships/followers/active.json', :params => {:uid => uid}.merge(opts)
      end
      
      # 获取当前登录用户的关注人中又关注了指定用户的用户列表
      #
      # @param [int64] uid 指定的关注目标用户UID
      # @param [Hash] opts 
      # @option opts [int] :count 单页返回的记录条数，默认为50
      # @option opts [int] :page  返回结果的页码，默认为1
      #
      # @see http://open.weibo.com/wiki/2/friendships/friends_chain/followers
      def friends_chain_followers(uid, opts={})
        get 'friendships/friends_chain/followers.json', :params => {:uid => uid}.merge(opts)
      end
      
      # 获取两个用户之间的详细关注关系情况
      #
      # @param [Hash] opts 
      # @option opts [int64] :source_id 源用户的UID
      # @option opts [String] :source_screen_name 源用户的微博昵称
      # @option opts [int64] :target_id 目标用户的UID
      # @option opts [String] :target_screen_name 目标用户的微博昵称
      #
      # @see http://open.weibo.com/wiki/2/friendships/show
      def show(opts={})
        get 'friendships/show.json', :params => opts
      end
      
      #
      # write
      #
      
      # no test below
      # 关注一个用户
      # 
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要关注的用户ID
      # @option opts [String] :screen_name 需要关注的用户昵称
      #
      # @see http://open.weibo.com/wiki/2/friendships/create
      def create(opts={})
        post 'friendships/create.json', :body => opts
      end
      
      # 根据用户UID批量关注用户 [Privilege]
      #
      # @param [String] uids 要关注的用户UID，用半角逗号分隔，最多不超过20个
      #
      # @see http://open.weibo.com/wiki/2/friendships/create_batch
      def create_batch(uids)
        post 'friendships/create_batch.json', :body => {:uids => uids}
      end

      # 取消关注一个用户
      # 
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要取消关注的用户ID
      # @option opts [String] :screen_name 需要取消关注的用户昵称
      #
      # @see http://open.weibo.com/wiki/2/friendships/destroy
      def destroy(opts={})
        post 'friendships/destroy.json', :body => opts
      end
  
      # 更新当前登录用户所关注的某个好友的备注信息 [Privilege]
      #
      # @param [int64] uid     需要修改备注信息的用户UID
      # @param [String] remark 备注信息
      #
      # @see http://open.weibo.com/wiki/2/friendships/remark/update
      def remark_update(uid, remark)
        post 'friendships/remark/update.json', :body => {:uid => uid, :remark => remark}
      end
            
    end
  end
end
