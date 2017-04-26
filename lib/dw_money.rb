require "dw_money"

class DwMoney
  include Comparable
  
  VERSION = "0.1.0"

  attr_accessor :val, :currency

  def initialize(value, currency)
    @val = value
    @currency = currency
  end

  @rates = {
    :default_currency => "EUR",
    :currecy_rates => {'USD' => 1.11, 'Bitcoin' => 0.0047, '$U' => 31}          
  }
 
  def self.conversion_rates(default_currency, rates = {})
    @rates[:default_currency] = default_currency
    @rates[:currecy_rates] = rates
  end

  def self.config
    @rates
  end

  def +(other_money)
    new_value = self.convert_to(default_currency).val + other_money.convert_to(default_currency).val
    DwMoney.new(new_value, default_currency)
  end

  def -(other_money)
    new_value = self.convert_to(default_currency).val - other_money.convert_to(default_currency).val
    DwMoney.new(new_value, default_currency)
  end

  def *(other_money)
    new_value = self.convert_to(default_currency).val * other_money.convert_to(default_currency).val
    DwMoney.new(new_value, default_currency)
  end

  def /(other_money)
    new_value = self.convert_to(default_currency).val / other_money.convert_to(default_currency).val
    DwMoney.new(new_value, default_currency)
  end

  def convert_to(other_currency)
    if other_currency == currency 
      self
    elsif other_currency == default_currency
      DwMoney.new(val / conversion_rate(currency), default_currency)
    else
      DwMoney.new(val * conversion_rate(other_currency), other_currency) 
    end
  end

  def ==(other_money)
    val.to_f.round(2) == other_money.val.to_f.round(2) && currency == other_money.currency
  end

  def <=>(other_money)
    self.convert_to(default_currency).val <=> other_money.convert_to(default_currency).val
  end

  def inspect
    "#{val} #{currency}"
  end

  private

  def default_currency
    DwMoney.config[:default_currency]
  end

  def conversion_rate(currency_val)
    DwMoney.config[:currecy_rates][currency_val]
  end

end
