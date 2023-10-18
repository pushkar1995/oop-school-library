require_relative 'app'
require 'json'

class OnloadingData
  def initialize(app)
    @app = app
  end

  def onloading_books_data
    file_name = './books.json'
    return unless File.exist?(file_name)

    file = File.read(file_name)
    data_hash = JSON.parse(file)
    data_hash.each do |book|
      book = Book.new(book['title'], book['author'], id: book['id'])
      @app.books.push(book)
    end
  end

  def onloading_rentals_data
    file_name = './rentals.json'
    return unless File.exist?(file_name)

    file = File.read(file_name)
    data_hash = JSON.parse(file)
    data_hash.each do |rental|
      result_person = @app.people.find { |person| person.id == rental['person'] }
      result_book = @app.books.find { |book| book.id == rental['book'] }
      rental = Rental.new(rental['date'], result_book, result_person) if result_person && result_book
      @app.rentals.push(rental)
    end
  end

  def onloading_people_data
    file_name = './people.json'
    return unless File.exist?(file_name)

    file = File.read(file_name)
    data_hash = JSON.parse(file)
    data_hash.each do |person|
      hash = { id: person['id'], parent_permission: person['parent_permission'] }
      hash['specialization'] = person['specialization'] if person['specialization']
      person = Object.const_get(person['type']).new(person['name'], person['age'], **hash)
      @app.people.push(person)
    end
  end
end
