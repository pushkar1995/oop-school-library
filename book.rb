class Book
  attr_accessor :title, :author, :rental
  attr_reader :id

  def initialize(title, author, id: nil)
    @title = title
    @author = author
    @rental = []
    @id = id || Random.rand(1...100)
  end

  # def add_rental(rental)
  #   @rental << rental
  # end
end
