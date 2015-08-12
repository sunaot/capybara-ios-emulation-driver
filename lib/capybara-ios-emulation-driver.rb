require 'capybara'
require 'selenium-webdriver'
require "capybara-ios-emulation-driver/version"
require "capybara-ios-emulation-driver/user_agent"
require "capybara-ios-emulation-driver/profile/chrome"
require "capybara-ios-emulation-driver/profile/firefox"

module Capybara::Selenium::Driver::Ios
  def self.chrome_driver params = {}
    options = {
      :ios_version => 8,
      :ios_device  => :iphone,
      :app         => nil
    }.update(params)

    ::Capybara::Selenium::Driver.new(options[:app], Profile::Chrome.driver_options(options).merge(:browser => :chrome))
  end

  def self.firefox_driver params = {}
    options = {
      :ios_version => 8,
      :ios_device  => :iphone,
      :app         => nil
    }.update(params)

    ::Capybara::Selenium::Driver.new(options[:app], Profile::Firefox.driver_options(options).merge(:browser => :firefox))
  end
end

module Capybara::RackTest::Driver::Ios
  def self.rack_test_driver params = {}
    options = {
      :ios_version => 8,
      :ios_device  => :iphone,
      :app         => nil,
      :rack_test_options => {}
    }.update(params)

    ua = ::Capybara::IosEmulationDriver::UserAgent.of(:ios => options[:ios_version], :device => options[:ios_device])
    driver = Class.new(::Capybara::RackTest::Driver)
    driver.module_eval %|
      def env
        super.merge('HTTP_USER_AGENT' => "#{ua}")
      end
    |
    driver.new(options[:app], options[:rack_test_options])
  end
end
