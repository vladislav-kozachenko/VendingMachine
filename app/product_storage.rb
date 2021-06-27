require './app/errors/empty_cell_error'
require './app/errors/cell_not_exists_error'

class ProductStorage
  # structure for storage:
  # { cell: { product: 'Name', amount: number, price: number }}
  def initialize(products = {})
    @storage = products
  end

  def get_product(cell_number)
    cell = @storage[cell_number]
    raise CellNotExistsError unless cell
    raise EmptyCellError if cell[:amount].zero?

    cell[:amount] -= 1
    cell[:product]
  end

  def get_price(cell_number)
    cell = @storage[cell_number]
    raise CellNotExistsError unless cell

    cell[:price]
  end

  def to_s
    @storage.to_s
  end
end