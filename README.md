# DwMoney

This gem is an exercise to provide basic currency exchange.
Some of its features are:
- Allow a config by setting configuration rates to the gem
- Allow basic math operations
- Allow comparison operations

Assumptions: in all the math operations a DwMoney object is returned and the operation is performed on the default currency.
For == only 2 decimal places are taken into account.

## Installation

This gem has not been upload to ruby gem, since its an exercise and its sole purpose is that, so the steps to use it and test it are:

- Download/clone git repo
- gem build dw_money.gemspec
- gem install ./dw_money-0.1.0.gem

## Usage

Go to irb and start playing with it.
- require "dw_money"
- one_euro = DwMoney.new(1, 'EUR')
- two_euro = DwMoney.new(2, 'EUR')
- one_euro > two_euro
- one_euro * two_euro
...

## Development

GitHub repo -> https://github.com/nacasuy/dw_money

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nacasuy/dw_money


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

