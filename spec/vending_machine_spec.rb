require './app/vending_machine'

describe VendingMachine do
  let(:storage) {
    {
      a1: { product: 'Chocolate', amount: 10, price: 20_00 },
      a2: { product: 'Biscuits', amount: 10, price: 25_00 },
      a3: { product: 'Chips', amount: 10, price: 37_00 },
      a4: { product: 'Cola', amount: 10, price: 15_00 },
      a5: { product: 'Energy Drink', amount: 10, price: 40_00 }
    }
  }

  let(:change) {
    {
      500 => 100,
      300 => 100,
      200 => 100,
      100 => 100,
      50 => 100,
      25 => 100
    }
  }

  let(:vending_machine) { VendingMachine.new(storage, change) }

  context 'with money' do
    before { vending_machine.insert_money_cents(10000) }

    it 'should to sell a product' do
      expect(vending_machine.select_cell(:a1)).to eq('Chocolate')
    end

    it 'should to return change' do
      expect(vending_machine.get_change).to eq({ 500 => 20 })
    end

    it 'should to raise error for wrong cell number' do
      expect { vending_machine.select_cell(:s3) }.to raise_error
    end
  end

  context 'without money' do
    it 'should to raise error' do
      expect { vending_machine.select_cell(:a1) }.to raise_error
    end
  end
end
