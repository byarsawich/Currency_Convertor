require './currency_converter'

class CurrencyTrader
  attr_accessor :converterpast

  def initialize(converterpresent, converterpast, currency)
    @converterpresent = converterpresent
    @converterpast = converterpast
    @currency = currency
  end

  def lets_make_a_trade()
    #array of first conversion
    intial_conversion = convert_at_rates(@converterpast, @currency)
    temp_conversions = []
    temp_type = []
    intial_conversion.each do |temp_currency|
      temp_conversions << @converterpresent.convert(temp_currency, @currency.type)
      temp_type << temp_currency.type
    end
    best_index = temp_conversions.index(temp_conversions.max)
    best_conversion = @converterpresent.convert(temp_conversions[best_index],temp_type[best_index])
    return best_conversion
  end

  private
  #takes in current converter and a currency and converts the currency to all of the currencies in the converter
  def convert_at_rates(converter, currency)
    rates_conversion = []
    converter.rates.each_key do |key|
      rates_conversion << converter.convert(currency, key)
    end
    return rates_conversion
  end

  private
  #go through array of conversions and see which has the highest value in initial
  #currency and return that as a currency with the origional currency type
  #i.e. if it turns out that GBP has the best value for conversions after changing to USD
  #it will return the currency in GBP
  #currently not used in hard mode
  def check_investment(curent_currencies, current_converter)
    temp_array = []
    temp_type = []
    curent_currencies.each do |temp_cur|
      temp_array << current_converter.convert(temp_cur, @currency.type)
      temp_type << temp_cur.type
    end
    best_index = temp_array.index(temp_array.max)
    best_conversion = current_converter.convert(temp_array[best_index],temp_type[best_index])
    binding.pry
    return best_conversion
  end
end
