class NotEnoughMoneyError < StandardError
  def initialize(message = 'Not enough money. Please insert money or change other cell')
    super
  end
end