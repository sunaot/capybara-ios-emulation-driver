require 'minitest/autorun'
require 'capybara-ios-emulation-driver'
require 'capybara/dsl'

class TestCapybaraIosEmulation < Minitest::Test
  include ::Capybara::DSL

  def test_chrome_driver
    Capybara.register_driver :ios_chrome do |app|
      Capybara::Selenium::Driver::Ios.chrome_driver
    end
    Capybara.default_driver = :ios_chrome
    options = page.driver.options[:switches]
    assert options.any? {|opt| opt =~ /iPhone/ }
  end

  def test_firefox_driver
    Capybara.register_driver :ios_ff do |app|
      Capybara::Selenium::Driver::Ios.firefox_driver
    end
    Capybara.default_driver = :ios_ff
    options = page.driver.options[:profile].instance_variable_get(:@additional_prefs)
    assert options.values.any? {|opt| opt =~ /iPhone/ }
  end

  def test_rack_test_driver
    Capybara.register_driver :ios_rack_test do |app|
      Capybara::RackTest::Driver::Ios.rack_test_driver :app => app
    end
    Capybara.app = proc { [ 200, {}, 'rack app' ] }
    Capybara.default_driver = :ios_rack_test
    visit '/'
    assert_equal 'rack app', page.body
  end
end
