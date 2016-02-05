require 'pry'
require './currency_converter'

c = Currency.new(3.45)
d = Currency.new(10.00)
e = Currency.new(10.00, "GBP")

temp = Currency_Converter.new

f = temp.convert(e, :YEN)

puts f.to_s

puts c.amount.to_s
puts (c + d).to_s
# binding.pry
# puts "test"
# puts (e + c).to_s
