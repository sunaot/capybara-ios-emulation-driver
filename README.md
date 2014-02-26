# capybara-ios-emulation-driver

[![Build Status](https://travis-ci.org/sunaot/capybara-ios-emulation-driver.png)](https://travis-ci.org/sunaot/capybara-ios-emulation-driver)

Enable drivers to emulate iOS user agent.

## Installation

Add this line to your application's Gemfile:

    gem 'capybara-ios-emulation-driver'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-ios-emulation-driver

## Usage

```
# chrome
Capybara.register_driver :ios_chrome do |app|
  Capybara::Selenium::Driver::Ios.chrome_driver
end
Capybara.default_driver = :ios_chrome

# firefox
Capybara.register_driver :ios_ff do |app|
  Capybara::Selenium::Driver::Ios.firefox_driver
end
Capybara.default_driver = :ios_ff

# rack test
Capybara.register_driver :ios_rack_test do |app|
  Capybara::Selenium::Driver::Ios.rack_test_driver :app => app
end
Capybara.default_driver = :ios_rack_test
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/capybara-ios-emulation-driver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
