class CoinsStorage
  # structure: { denomination => amount }
  def initialize(coins = {})
    @storage = coins
  end

  def get_change(value)
    change = {}
    @storage.each do |denomination, amount|
      next if value < denomination || amount.zero?

      amount_coins = (value/denomination).to_i
      if amount_coins <= amount
        change[denomination] = amount_coins
        @storage[denomination] -= amount_coins
      else
        change[denomination] = amount
        @storage[denomination] = 0
      end
      value -= denomination * change[denomination]
      break if value.zero?
    end
    change
  end
end