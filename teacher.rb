require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = 'Unknown', age = 0, id: nil, parent_permission: true)
    super(age, name, id: id, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
