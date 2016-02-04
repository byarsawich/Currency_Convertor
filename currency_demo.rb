require 'pry'
require './currency'

c = Currency.new(3.45)
d = Currency.new(1.05)
e = Currency.new(2.25, "YEN")

puts c.amount.to_s
puts (c + d).to_s
binding.pry
