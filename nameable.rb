require_relative 'person'

# class Nameable
class Nameable
  def correct_name
    raise NotImplementedError
  end
end

# class Decoration < Nameable
class Decorator < Nameable
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# class CapitalizeDecorator < Decorator
class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

# class TrimmerDecorator < Decorator
class TrimmerDecorator < Decorator
  def correct_name
    name = super
    return name[0, 10] if name.length > 10

    name
  end
end