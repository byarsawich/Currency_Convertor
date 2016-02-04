require 'pry'

class Currency
  attr_accessor:amount
  attr_accessor:type

  @@currency_types = {"$" => :USD, "¥" => :JPY, "£" => :GBP, "€" => :EUR}

  def initialize(amount = 0.0, type = :USD)
    @amount = amount.to_f
    @type = type.to_sym
  end

  class << self
  private
    def check_currency_symbol(value)
      @@currency_types[value]
    end
  end

  def +(value)
    Currency.new(@amount += value.amount, @type)
  end

  def -(value)
    Currency.new(@amount -= value.amount, @type)
  end

  def ==(value)
    @amount == value.amount && @type == value.type
  end

  def !=(value)
    @amount != value.amount || @type != value.type
  end

  def compare_currency_type(value)
    @type == value.type
  end

  def *(value)
    Currency.new(@amount * value, @type)
  end

  def /(value)
    Currency.new(@amount / value, @type)
  end

  def to_s
    @amount.to_s + " " + @type.to_s
  end
end
