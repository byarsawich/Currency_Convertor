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
    if value.class == Fixnum || value.class == Float
      Currency.new(@amount + value, @type)
    elsif value.type == @type
      Currency.new(@amount + value.amount, @type)
    else
      raise DifferentCurrencyCodeError.new("added")
    end
  rescue => e
    puts e.inspect
  end

  def -(value)
    if value.class == Fixnum || value.class == Float
      Currency.new(@amount - value, @type)
    elsif value.type == @type
      Currency.new(@amount - value.amount, @type)
    else
      raise DifferentCurrencyCodeError.new("subtracted")
    end
  rescue => e
    puts e.inspect
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
    if value.class == Fixnum || value.class == Float
      Currency.new(@amount * value, @type)
    elsif value.type == @type
      Currency.new(@amount * value.amount, @type)
    else
      raise DifferentCurrencyCodeError.new("multiplied")
    end
  rescue => e
    puts e.inspect
  end

  def /(value)
    if value.class == Fixnum || value.class == Float
      Currency.new(@amount / value, @type)
    elsif value.type == @type
      Currency.new(@amount / value.amount, @type)
    else
      raise DifferentCurrencyCodeError.new("subtracted")
    end
  rescue => e
    puts e.inspect
    Currency.new(@amount / value, @type)
  end

  def to_s
    "#{@amount} #{@type}"
  end

  def inspect
    self.to_s
  end
end

class DifferentCurrencyCodeError < StandardError
  def initialize(operation = "used that way", msg = "Two different types of currencies can not be ")
    super(msg + operation)
  end
end
