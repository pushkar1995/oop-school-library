# frozen_string_literal: true

require_relative 'person'

# This is a Teacher class that represents a teacher in a school.
# class Teacher < Person
# end
class Teacher < Person
  def initialize(id, specialization, age = 0, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
