require 'pry'
require './currency_converter'

a = Currency.new()
b = Currency.new(3.45)
c = Currency.new("10.00")
d = Currency.new(10.00, "GBP")
e = Currency.new("$5.00")
f = Currency.new("€25.43")

puts "#{a}\n#{b}\n#{c}\n#{d}\n#{e}\n#{f}"

temp = CurrencyConverter.new

g = temp.convert(c, :EUR)

puts g.to_s
puts (g + f).to_s
puts (c - b).to_s
puts (c * 5).to_s
puts (d / 2).to_s
puts (c / b).to_s
puts (f / g).to_s
