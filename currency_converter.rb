require "./currency"

class Currency_Converter
  RATES = {USD: 1.0, GBP: 0.69044, EUR: 0.89723, INR: 67.7981, AUD: 1.41307, CAD: 1.38804,
          ZAR: 15.9772, NZD: 1.50979, JPY: 116.909, KRW: 1204.53, RUB: 77.2611, NOK: 8.59570}

  def initialize(rates = RATES)
    @rates = rates
  end

  def convert(cur, type)
    raise ArgumentError "Parameter passed is not a Currency object" if cur.class != Currency
    raise UnknownCurrencyCodeError if !@rates[type] || !@rates[cur.type]
    conversion_rate = @rates[type] / @rates[cur.type]
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