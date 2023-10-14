require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(name = 'Unknown', age = 0, parent_permission: true, nameable: nil)
    super()
    @id = Random.rand(1...100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @nameable = nameable
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_service?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
