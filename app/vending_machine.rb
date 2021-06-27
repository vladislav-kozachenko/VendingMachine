require './app/product_storage'
require './app/coins_storage'
require './app/errors/not_enough_money_error'

class VendingMachine
  def initialize(products, change)
    @product_storage = ProductStorage.new(products)
    @change_storage = CoinsStorage.new(change)
    @client_balance = 0
  end

  def insert_money_cents(cents)
    @client_balance += cents
  end

  def select_cell(cell_number)
    price = @product_storage.get_price(cell_number)
    raise NotEnoughMoneyError if price > @client_balance
    product = @product_storage.get_product(cell_number)
    @client_balance -= price
    product
  end

  def get_change
    change = @change_storage.get_change(@client_balance)
    sum = change.map { |denomination, amount| denomination * amount }.inject(0, :+)
    puts "Sorry we don't have a coins for change. Please call the support" if sum < @client_balance
    @client_balance -= sum
    change
  end

  def run
    while true
      begin
        clear_display
        puts 'Please insert money (cents)'
        insert_money_cents(gets.chomp.to_i)
        clear_display
        puts 'Please select cell'
        product = select_cell(gets.chomp.to_sym)
        puts product
        puts 'Do you want to order another product? (y/n)'
        answer = gets.chomp
        puts get_change if answer != 'y'
      rescue => e
        puts e.message
      ensure
        sleep(5)
      end
    end
  end

  private

  def clear_display
    system('clear')
    puts "Current ballance is #{@client_balance}"
    puts @product_storage
  end

end