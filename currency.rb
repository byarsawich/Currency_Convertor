class Currency
  attr_accessor:amount
  attr_accessor:type

  CURRENCIES = {"$" => :USD, "¥" => :JPY, "£" => :GBP, "€" => :EUR}

  def initialize(amount = 0.0, type = :USD)
    if amount.class == String
      symbol = amount.gsub(/\d+[,.]\d+/, '').strip
      @amount = amount.scan(/\d+[,.]\d+/).join('').strip.to_f
      if CURRENCIES[symbol]
        @type = CURRENCIES[symbol].to_sym
      else
        @type = type.to_sym
      end
    else
      @amount = amount.to_f
      @type = type.upcase.to_sym
    end
  end

  def +(value)
    if value.class == Fixnum || value.class == Float
      return Currency.new(@amount + value, @type)
    elsif value.type == @type
      return Currency.new(@amount + value.amount, @type)
    else
      raise DifferentCurrencyCodeError.new("added")
    end
  rescue => e
    puts e.inspect
  end

  def -(value)
    if value.class == Fixnum || value.class == Float
      return Currency.new(@amount - value, @type)
    elsif value.type == @type
      return Currency.new(@amount - value.amount, @type)
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
      return Currency.new(@amount * value, @type)
    elsif value.type == @type
      return Currency.new(@amount * value.amount, @type)
    else
      raise DifferentCurrencyCodeError.new("multiplied")
    end
  rescue => e
    puts e.inspect
  end

  def /(value)
    if value.class == Fixnum || value.class == Float
      return Currency.new(@amount / value, @type)
    elsif value.type == @type
      return Currency.new(@amount / value.amount, @type)
    else
      raise DifferentCurrencyCodeError.new("divided")
    end
  rescue => e
    puts e.inspect
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
