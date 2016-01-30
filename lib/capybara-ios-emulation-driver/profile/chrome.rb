module Capybara::Selenium::Driver::Ios
  module Profile
    class Chrome
      def self.driver_options(params = {})
        options = {
          :ios_version => 8,
          :ios_device  => :iphone,
        }.update(params)

        profile = ::Selenium::WebDriver::Chrome::Profile.new
        ua = ::Capybara::IosEmulationDriver::UserAgent.of(:ios => options[:ios_version], :device => options[:ios_device])
        {
          :switches => [ '--allow-running-insecure-content',
                         "--user-agent='#{ua}'" ],
          :prefs => profile
        }
      end
    end
  end
end
