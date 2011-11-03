# encoding: utf-8
module Weibo2
  module Interface
  
    # Register API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E6.B3.A8.E5.86.8C
    class Register < Base
    
      # 验证昵称是否可用，并给予建议昵称
      #
      # @param [String] nickname 需要验证的昵称。4-20个字符，支持中英文、数字、"_"或减号
      # @see http://open.weibo.com/wiki/2/register/verify_nickname
      def verify_nickname(nickname)
        get 'register/verify_nickname.json', :params => {:nickname => nickname}
      end
      
    end
  end
end
