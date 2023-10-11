# class Person
class Person
  def initialize(id, age = 0, name = 'Unknown', parent_permission: true)
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

  attr_reader :id
  attr_accessor :name, :age
end
