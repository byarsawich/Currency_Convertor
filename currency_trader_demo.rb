require 'pry'

require './currency_trader'

old_converter = CurrencyConverter.new({USD: 1.0, EUR: 0.75, GBR: 0.5})
new_converter = CurrencyConverter.new({USD: 1.0, EUR: 0.4, GBR: 0.7})
temp = CurrencyTrader.new(new_converter,old_converter, Currency.new(1000.00))
# binding.pry
temp_cur = temp.lets_make_a_trade

puts temp_cur
