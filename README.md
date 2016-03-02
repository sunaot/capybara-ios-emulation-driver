# capybara-ios_emulation_driver [![Build Status](https://travis-ci.org/sunaot/capybara-ios_emulation_driver.svg?branch=master)](https://travis-ci.org/sunaot/capybara-ios_emulation_driver)

Enable drivers to emulate iOS user agent.

`capybara-ios-emulation-driver` is renamed to `capybara-ios_emulation_driver`. v0.0.9 is the last version of `capybara-ios-emulation-driver`. Please use `capybara-ios_emulation_driver` instead of it.

## Installation

Add this line to your application's Gemfile:

    gem 'capybara-ios_emulation_driver'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-ios_emulation_driver

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
  Capybara::RackTest::Driver::Ios.rack_test_driver :app => app
end
Capybara.default_driver = :ios_rack_test
```

## Contributing

1. Fork it ( http://github.com/sunaot/capybara-ios_emulation_driver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
