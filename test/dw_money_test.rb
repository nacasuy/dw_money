require 'test_helper'

class DwMoneyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil DwMoney::VERSION
  end

  def test_it_accepts_config
    DwMoney.conversion_rates('EUR', {'USD' => 1.11}  )
    assert_equal DwMoney.config[:default_currency], 'EUR'
    assert DwMoney.config[:currecy_rates].keys.include? 'USD'
  end

  def test_convert_to
    DwMoney.conversion_rates('EUR', {'USD' => 1.11})
    one_euro = DwMoney.new(1, 'EUR')
    assert_equal one_euro.convert_to('USD'), DwMoney.new((1*1.11), 'USD')
  end

  def test_math_ops  
    DwMoney.conversion_rates('EUR', {'USD' => 1.11})
    one_euro = DwMoney.new(1, 'EUR')
    two_usd = DwMoney.new(2, 'USD')
    assert_equal one_euro + two_usd, DwMoney.new((1 + 2/1.11), 'EUR')
    assert_equal two_usd - one_euro, DwMoney.new((2/1.11 - 1), 'EUR')
    assert_equal one_euro * two_usd, DwMoney.new((1 * (2/1.11)), 'EUR')
    assert_equal one_euro / two_usd, DwMoney.new((1 / (2/1.11)), 'EUR')
  end

  def test_equality
    one_euro = DwMoney.new(1.034, 'EUR')
    another_euro = DwMoney.new(1.035, 'EUR')
    assert one_euro == another_euro
    yet_another_euro = DwMoney.new(1.04, 'EUR')
    assert one_euro != yet_another_euro
  end

  def test_comparison
    one_euro = DwMoney.new(1.034, 'EUR')
    another_euro = DwMoney.new(1.035, 'EUR')
    assert one_euro < another_euro
    yet_another_euro = DwMoney.new(1.04, 'EUR')
    assert one_euro < yet_another_euro
  end

end
