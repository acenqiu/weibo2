# encoding: utf-8
module Weibo2
  module Interface
  
    # Search API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E6.90.9C.E7.B4.A2
    class Search < Base
      
      # 搜索用户时的联想搜索建议 
      #
      # @param [String] q 搜索的关键字
      # @param [Hash] opts
      # @option opts [int] :count 返回的记录条数，默认为10
      #
      # @see http://open.weibo.com/wiki/2/search/suggestions/users
      def suggestions_users(q, opts={})
        get 'search/suggestions/users.json', :params => {:q => q}.merge(opts)
      end
      
      # 搜索微博时的联想搜索建议
      #
      # @param [String] q 搜索的关键字
      # @param [Hash] opts
      # @option opts [int] :count 返回的记录条数，默认为10
      #
      # @see http://open.weibo.com/wiki/2/search/suggestions/statuses
      def suggestions_statuses(q, opts={})
        get 'search/suggestions/statuses.json', :params => {:q => q}.merge(opts)
      end
      
      # 搜索学校时的联想搜索建议
      #
      # @param [String] q 搜索的关键字
      # @param [Hash] opts
      # @option opts [int] :count 返回的记录条数，默认为10
      # @option opts [int] :type  学校类型，0：全部、1：大学、2：高中、3：中专技校、4：初中、5：小学，默认为0
      #
      # @see http://open.weibo.com/wiki/2/search/suggestions/schools
      def suggestions_schools(q, opts={})
        get 'search/suggestions/schools.json', :params => {:q => q}.merge(opts)
      end
      
      # 搜索公司时的联想搜索建议
      #
      # @param [String] q 搜索的关键字
      # @param [Hash] opts
      # @option opts [int] :count 返回的记录条数，默认为10
      #
      # @see http://open.weibo.com/wiki/2/search/suggestions/companies
      def suggestions_companies(q, opts={})
        get 'search/suggestions/companies.json', :params => {:q => q}.merge(opts)
      end
      
      # 搜索应用时的联想搜索建议
      #
      # @param [String] q 搜索的关键字
      # @param [Hash] opts
      # @option opts [int] :count 返回的记录条数，默认为10
      #
      # @see http://open.weibo.com/wiki/2/search/suggestions/apps
      def suggestions_apps(q, opts={})
        get 'search/suggestions/apps.json', :params => {:q => q}.merge(opts)
      end
      
      # @用户时的联想建议
      #
      # @param [String] q 搜索的关键字
      # @param [int] type 联想类型，0：关注、1：粉丝
      # @param [Hash] opts
      # @option opts [int] :count 返回的记录条数，默认为10，粉丝最多1000，关注最多2000
      # @option opts [int] :range 联想范围，0：只联想关注人、1：只联想关注人的备注、2：全部，默认为2
      #
      # @see http://open.weibo.com/wiki/2/search/suggestions/at_users
      def suggestions_at_users(q, type, opts={})
        get 'search/suggestions/at_users.json', :params => {:q => q, :type => type}.merge(opts)
      end
      
      #TODO:test no pass
      # 综合联想，包含用户、微群、应用等的联想建议
      #
      # @param [String] query 搜索的关键字
      # @param [Hash] opts
      # @option opts [int] :sort_user  用户排序，0：按专注人最多，默认为0
      # @option opts [int] :sort_app   应用排序，0：按用户数最多，默认为0
      # @option opts [int] :sort_grp   微群排序，0：按成员数最多，默认为0
      # @option opts [int] :user_count 返回的用户记录条数，默认为4
      # @option opts [int] :app_count  返回的应用记录条数，默认为1
      # @option opts [int] :grp_count  返回的微群记录条数，默认为1
      #
      # @see http://open.weibo.com/wiki/2/search/suggestions/integrate
      def suggestions_integrate(q, opts={})
        get 'search/suggestions/integrate.json', :params => {:query => q}.merge(opts)
      end
      
      # 搜索与指定的一个或多个条件相匹配的微博 [Privilege]
      #
      # @param [Hash] opts
      # @option opts [String] :q          搜索的关键字
      # @option opts [int] :filter_ori    过滤器，是否为原创，0：全部、1：原创、2：转发，默认为0
      # @option opts [int] :filter_pic    过滤器。是否包含图片，0：全部、1：包含、2：不包含，默认为0
      # @option opts [int64] :fuid        搜索的微博作者的用户UID
      # @option opts [int] :province      搜索的省份范围，省份ID
      # @option opts [int] :city          搜索的城市范围，城市ID
      # @option opts [int64] :starttime   开始时间，Unix时间戳
      # @option opts [int64] :endtime     结束时间，Unix时间戳
      # @option opts [int] :count         单页返回的记录条数，默认为10
      # @option opts [int] :page          返回结果的页码，默认为1
      # @option opts [boolean] :needcount 返回结果中是否包含返回记录数，true：返回、false：不返回，默认为false
      # @option opts [int] :base_app      是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0
      #
      # @see http://open.weibo.com/wiki/2/search/statuses
      def statuses(opts={})
        get 'search/statuses.json', :params => opts
      end
      
      # 获取指定地点周边的微博列表 [Privilege]
      #
      # @param [float] longitude 经度。有效范围：-180.0到+180.0，+表示东经
      # @param [float] latitude  纬度。有效范围：-90.0到+90.0，+表示北纬
      # @param [Hash] opts
      # @option opts [int] :range 搜索范围，单位米，默认500米，最大11132米
      # @option opts [int] :time  返回结果所在的时间段，单位为分钟，指从现在开始之前的时间段
      # @option opts [int] :sort_type 排序方式。默认为0，按时间排序；为1时按与中心点距离进行排序
      # @option opts [int] :page  返回结果页码。默认为1
      # @option opts [int] :count 每页结果数。默认10，最大50
      # @option opts [int] :base_app 是否根据当前应用返回数据。默认0：全部应用；1：仅限当前应用
      #
      # @see http://open.weibo.com/wiki/2/search/geo/statuses
      def geo_statuses(longitude, latitude, opts={})
        get 'search/geo/statuses.json', :params => {:longitude => longitude, :latitude => latitude}.merge(opts)
      end
      
      # 通过关键词搜索用户 [Privilege]
      #
      # @param [Hash] opts
      # @option opts [String] :q        搜索的关键字
      # @option opts [int] :snick       搜索范围是否包含昵称，0：不包含、1：包含
      # @option opts [int] :sdomain     搜索范围是否包含个性域名，0：不包含、1：包含
      # @option opts [int] :sintro      搜索范围是否包含简介，0：不包含、1：包含
      # @option opts [int] :stag        搜索范围是否包含标签，0：不包含、1：包含
      # @option opts [int] :province    搜索的省份范围，省份ID
      # @option opts [int] :city        搜索的城市范围，城市ID
      # @option opts [String] :gender   搜索的性别范围，m：男、f：女
      # @option opts [String] :comorsch 搜索的公司学校名称
      # @option opts [int] :sort        排序方式，1：按更新时间、2：按粉丝数，默认为1
      # @option opts [int] :count       单页返回的记录条数，默认为10
      # @option opts [int] :page        返回结果的页码，默认为1
      # @option opts [int] :base_app    是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0
      #
      # @see http://open.weibo.com/wiki/2/search/users
      def users(opts={})
        get 'search/users.json', :params => opts
      end
      
    end
  end
end
