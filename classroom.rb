require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(individualstudent)
    @students.push(individualstudent)
    individualstudent.classroom = self
  end
end
