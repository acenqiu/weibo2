# encoding: utf-8
module Weibo2
  module Interface
  
    # Account API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E8.B4.A6.E5.8F.B7
    class Account < Base
      
      # 获取用户基本信息 [Privilege]
      #
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要获取基本信息的用户UID，默认为当前登录用户
      #
      # @see http://open.weibo.com/wiki/2/account/profile/basic
      def profile_basic(opts={})
        get 'account/profile/basic.json', :params => opts
      end
      
      # 获取用户的教育信息 [Privilege]
      #
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要获取教育信息的用户UID，默认为当前登录用户
      #
      # @see http://open.weibo.com/wiki/2/account/profile/education
      def profile_education(opts={})
        get 'account/profile/education.json', :params => opts
      end
      
      # 批量获取用户的教育信息 [Privilege]
      #
      # @param [String] uids 需要获取教育信息的用户UID，用半角逗号分隔，最多不超过20
      #
      # @see http://open.weibo.com/wiki/2/account/profile/education_batch
      def profile_education_batch(uids)
        get 'account/profile/education_batch.json', :params => {:uids => uids}
      end
      
      # 获取用户的职业信息 [Privilege]
      #
      # @param [Hash] opts 
      # @option opts [int64] :uid 需要获取教育信息的用户UID，默认为当前登录用户
      #
      # @see http://open.weibo.com/wiki/2/account/profile/career
      def profile_career(opts={})
        get 'account/profile/career.json', :params => opts
      end
      
      # 批量获取用户的职业信息 [Privilege]
      #
      # @param [String] uids 需要获取教育信息的用户UID，用半角逗号分隔，最多不超过20
      #
      # @see http://open.weibo.com/wiki/2/account/profile/career_batch
      def profile_career_batch(uids)
        get 'account/profile/career_batch.json', :params => uids
      end
      
      # 获取当前登录用户的隐私设置
      #
      # @see http://open.weibo.com/wiki/2/account/get_privacy
      def get_privacy
        get 'account/get_privacy.json'
      end
      
      # 获取所有的学校列表
      #
      # @param [Hash] opts 
      # @option opts [int] :province 省份范围，省份ID
      # @option opts [int] :city     城市范围，城市ID
      # @option opts [int] :area     区域范围，区ID
      # @option opts [int] :type     学校类型，1：大学、2：高中、3：中专技校、4：初中、5：小学，默认为1
      # @option opts [String] :capital 学校首字母，默认为A
      # @option opts [String] :keyword 学校名称关键字
      # @option opts [int] :count    返回的记录条数，默认为10
      #
      # @see http://open.weibo.com/wiki/2/account/profile/school_list
      def profile_school_list(opts={})
        get 'account/profile/school_list.json', :params => opts
      end
      
      # 获取当前登录用户的API访问频率限制情况
      #
      # @see http://open.weibo.com/wiki/2/account/rate_limit_status
      def rate_limit_status
        get 'account/rate_limit_status.json'
      end
      
      # OAuth授权之后，获取授权用户的UID
      #
      # @see http://open.weibo.com/wiki/2/account/get_uid
      def get_uid
        get 'account/get_uid.json'
      end
      
      #
      # write
      #
      
      # 更新用户的基本信息 [Privilege]
      #
      # @param [String] screen_name 用户昵称，不可为空
      # @param [int] province       省份代码ID，不可为空
      # @param [int] city           城市代码ID，不可为空
      # @param [String] gender      用户性别，m：男、f：女，不可为空
      # @param [Hash] opts 
      # @option opts [String] :real_name      用户真实姓名
      # @option opts [int] :real_name_visible 真实姓名可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [date] :birthday         用户生日，格式：yyyy-mm-dd
      # @option opts [int] :birthday_visible  生日可见范围，0：保密、1：只显示月日、2：只显示星座、3：所有人可见
      # @option opts [String] :qq             用户QQ号码
      # @option opts [int] :qq_visible        用户QQ可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [String] :msn            用户MSN
      # @option opts [int] :msn_visible       用户MSN可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [String] :url            用户博客地址
      # @option opts [int] :url_visible       用户博客地址可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [int] :credentials_type  证件类型，1：身份证、2：学生证、3：军官证、4：护照
      # @option opts [String] :credentials_num 证件号码
      # @option opts [String] :email          用户常用邮箱地址
      # @option opts [int] :email_visible     用户常用邮箱地址可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [String] :lang           语言版本，zh_cn：简体中文、zh_tw：繁体中文
      # @option opts [String] :description    用户描述，最长不超过70个汉字
      #
      # @see http://open.weibo.com/wiki/2/account/profile/basic_update
      def profile_basic_update(screen_name, province, city, gender, opts={})
        body = {:screen_name => screen_name, :province => province, :city => city, :gender => gender}.merge(opts)
        post 'account/profile/basic_update.json', :body => body
      end
      
      # 更新当前登录用户的教育信息 [Privilege]
      #
      # @param [int] type      学校类型，1：大学、2：高中、3：中专技校、4：初中、5：小学，默认为1
      # @param [int] school_id 学校代码
      # @param [Hash] opts 
      # @option opts [String] :id 需要修改的教育信息ID，不传则为新建，传则为更新
      # @option opts [int] :year  入学年份，最小为1900，最大不超过当前年份
      # @option opts [String] :department 院系或者班别
      # @option opts [int] :visible 开放等级，0：仅自己可见、1：关注的人可见、2：所有人可见
      #
      # @see http://open.weibo.com/wiki/2/account/profile/edu_update
      def profile_edu_update(type, school_id, opts={})
        post 'account/profile/edu_update.json', :body => {:type => type, :school_id => school_id}.merge(opts)
      end
      
      # 根据学校ID删除用户的教育信息 [Privilege]
      #
      # @param [int64] id 教育信息里的学校ID
      #
      # @see http://open.weibo.com/wiki/2/account/profile/edu_destroy
      def profile_edu_destroy(id)
        post 'account/profile/edu_destroy.json', :body => {:id => id}
      end
      
      # 更新当前登录用户的职业信息 [Privilege]
      #
      # @param [Hash] opts 
      # @option opts [String] :id 需要更新的职业信息ID
      # @option opts [int] :start 进入公司年份，最小为1900，最大为当年年份
      # @option opts [int] :end   离开公司年份，至今填0
      # @option opts [String] :department 工作部门
      # @option opts [int] :visible  可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [int] :province 省份代码ID，不可为空值
      # @option opts [int] :city     城市代码ID，不可为空值
      # @option opts [String] :company 公司名称，不可为空值
      #
      # @see http://open.weibo.com/wiki/2/account/profile/car_update
      def profile_car_update(opts)
        post 'account/profile/car_update.json', :body => opts
      end
      
      # 根据公司ID删除用户的职业信息 [Privilege]
      #
      # @param [int64] id 职业信息里的公司ID
      #
      # @see http://open.weibo.com/wiki/2/account/profile/car_destroy
      def profile_car_destroy(id)
        post 'account/profile/car_destroy.json', :body => {:id => id}
      end
      
      # no test
      # 更新当前登录用户的头像 [Privilege]
      #
      # @param [binary] image 头像图片，仅支持JPEG、GIF、PNG格式，图片大小小于5M.必须使用multipart/form-data方式提交
      #
      # @see http://open.weibo.com/wiki/2/account/avatar/upload
      def avatar_upload(image)
        post 'account/avatar/upload.json', :body => {:image => image}
      end
      
      # 更新当前登录用户的隐私设置 [Privilege]
      #
      # @param [Hash] opts 
      # @option opts [int] :comment  是否可以评论我的微博，0：所有人、1：关注的人，默认为0
      # @option opts [int] :geo      是否开启地理信息，0：不开启、1：开启，默认为1
      # @option opts [int] :message  是否可以给我发私信，0：所有人、1：关注的人，默认为0
      # @option opts [int] :realname 是否可以通过真名搜索到我，0：不可以、1：可以，默认为0
      # @option opts [int] :badge    勋章是否可见，0：不可见、1：可见，默认为1
      # @option opts [int] :mobile   是否可以通过手机号码搜索到我，0：不可以、1：可以，默认为0
      #
      # @see http://open.weibo.com/wiki/2/account/update_privacy
      def update_privacy(opts={})
        post 'account/update_privacy.json', :body => opts
      end
    end
  end
end
