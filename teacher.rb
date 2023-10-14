require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = 'Unknown', age = 0, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
