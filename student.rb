require_relative 'person'

# This is a Student class that represents a student in a school.
class Student < Person
  attr_accessor :classroom

  def initialize(id, classroom, age = 0, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_to_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
