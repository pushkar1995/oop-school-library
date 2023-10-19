require 'json'
require_relative 'app'

class StoringData
  def initialize(app)
    @app = app
  end

  def save_people_to_json
    people = @app.people.map do |person|
      hash = {
        type: person.class.name,
        name: person.name,
        id: person.id,
        age: person.age,
        parent_permission: person.parent_permission
      }
      hash['spacialization'] = person.specialization if person.respond_to? :specialization
      hash
    end

    filename = 'people.json'
    File.open(filename, 'w') do |file|
      file.puts(JSON.generate(people))
    end
  end

  def save_books_to_json
    books = @app.books.map do |book|
      {
        title: book.title,
        author: book.author,
        id: book.id
      }
    end

    filename = 'books.json'
    File.open(filename, 'w') do |file|
      file.puts(JSON.generate(books))
    end
  end

  def save_rentals_to_json
    rentals = @app.rentals.map do |rental|
      {
        date: rental.date,
        book: rental.book.id,
        person: rental.person.id
      }
    end

    filename = 'rentals.json'
    File.open(filename, 'w') do |file|
      file.puts(JSON.generate(rentals))
    end
  end
end
