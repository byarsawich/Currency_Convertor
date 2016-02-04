class Currency
  attr_accessor:amount
  attr_accessor:type

  def initialize(amount = 0.0, type = :"")
    @amount = amount.to_f
    @type = type.to_sym
  end

  def +(value)
    @anount += value.amount
  end

  def -(value)
    @amount -= value
  end

  def ==(value)
    @amount == value.amount && @type == value.type
  end

  def compare_currency_type(value)
    @type == value.type
  end

  def *(value)
    @amount *= value
  end

  def /(value)
    @amount /= value
  end
end
