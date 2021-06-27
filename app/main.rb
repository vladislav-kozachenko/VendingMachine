require './vending_machine'

storage = {
  a1: { product: 'Chocolate', amount: 10, price: 20_00 },
  a2: { product: 'Biscuits', amount: 10, price: 25_00 },
  a3: { product: 'Chips', amount: 10, price: 37_00 },
  a4: { product: 'Cola', amount: 10, price: 15_00 },
  a5: { product: 'Energy Drink', amount: 10, price: 40_00 }
}

change = {
  500 => 100,
  300 => 100,
  200 => 100,
  100 => 100,
  50 => 100,
  25 => 100
}

VendingMachine.new(storage, change).run