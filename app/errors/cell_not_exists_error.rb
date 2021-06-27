class CellNotExistsError < StandardError
  def initialize(message = 'Invalid cell number. Please select correct cell')
    super
  end
end