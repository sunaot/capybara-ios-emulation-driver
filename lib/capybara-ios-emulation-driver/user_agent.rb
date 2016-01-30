module Capybara::IosEmulationDriver
  LATEST_IOS_VERSION = 8

  module UserAgent
    module Ios8
      Iphone    = 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/8.0 Mobile/11A465 Safari/9537.53'
      Ipad      = 'Mozilla/5.0 (iPad; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/8.0 Mobile/11A465 Safari/9537.53'
      IpodTouch = 'Mozilla/5.0 (iPod touch; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/8.0 Mobile/11A465 Safari/9537.53'
    end

    module Ios7
      Iphone    = 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53'
      Ipad      = 'Mozilla/5.0 (iPad; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53'
      IpodTouch = 'Mozilla/5.0 (iPod touch; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53'
    end

    module Ios6
      Iphone    = 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25'
      Ipad      = 'Mozilla/5.0 (iPad; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25'
      IpodTouch = 'Mozilla/5.0 (iPod; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25'
    end

    module Ios5
      Iphone    = 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'
      Ipad      = 'Mozilla/5.0 (iPad; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'
      IpodTouch = 'Mozilla/5.0 (iPod; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'
    end

    #    ios: 5, 6, 7, 8
    # device: :iphone, :ipad, :ipod_touch
    def self.of(params = {})
      request = {
        :ios    => LATEST_IOS_VERSION,
        :device => :iphone,
      }.update(params)
      raise unless [5,6,7,8].include?(request[:ios].to_i)
      raise unless %w[iphone ipad ipod_touch].include?(request[:device].to_s.downcase)
      case request[:device].to_s.downcase
      when 'iphone'
        self.const_get("Ios#{request[:ios].to_i}::Iphone")
      when 'ipad'
        self.const_get("Ios#{request[:ios].to_i}::Ipad")
      when 'ipod_touch'
        self.const_get("Ios#{request[:ios].to_i}::IpodTouch")
      end
    end
  end
end
