require './currency_converter'

class CurrencyTrader
  def initialize(converternow, converterold, currency)
    @converternow = converternow
    @converterold = converterold
    @currency = currency
  end

  def lets_make_a_trade()
    old_rates_conversion = []
    @convertold.rates.each_key do |key|
      old_rates_conversion << @convertold.convert(@currency, key)
    end
    puts old_rates_conversion
  end
end
