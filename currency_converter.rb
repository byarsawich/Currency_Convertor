require "./currency"

class Currency_Converter
  RATES = {USD: 1.0, GBP: 0.69044, EUR: 0.89723}

  def convert(cur, type)
    raise ArgumentError "Parameter passed is not a Currency object" if cur.class != Currency
    raise UnknownCurrencyCodeError if !RATES[type] || !RATES[cur.type]
    conversion_rate = RATES[type] / RATES[cur.type]
    amount = cur.amount * conversion_rate
    return Currency.new(amount, cur.type)
  rescue => e
    print e.inspect + "\n"
    print e.backtrace
  end
end

class UnknownCurrencyCodeError < StandardError
  def initialize(msg = "Currency code not recognized/supported")
    super(msg)
  end
end
