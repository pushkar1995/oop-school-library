require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, age = 0, name = 'Unknown', parent_permission: true)
    super
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_service?
    of_age? || @parent_permission == true
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals ||= []
    @rentals.push(rental)
  end
end
