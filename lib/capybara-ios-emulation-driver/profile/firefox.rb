module Capybara::Selenium::Driver::Ios
  module Profile
    class Firefox
      def self.driver_options(params = {})
        options = {
          :ios_version => ::Capybara::IosEmulationDriver::LATEST_IOS_VERSION,
          :ios_device  => :iphone,
          'app.update.auto' => false,
          'app.update.enabled' => false,
        }.update(params)
        options['general.useragent.override'] = ::Capybara::IosEmulationDriver::UserAgent.of(:ios => options[:ios_version], :device => options[:ios_device])

        profile = ::Selenium::WebDriver::Firefox::Profile.new
        profile_params = options.reject {|k,v| v.nil? or [:ios_version, :ios_device].include?(k) }
        profile_params.each do |key, val|
          profile[key] = val
        end

        { :profile => profile }
      end
    end
  end
end
