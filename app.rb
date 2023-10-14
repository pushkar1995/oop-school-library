require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @people = []
    @books = []
    @rental = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class.name}] Name:#{person.name} ID:#{person.id} Age:#{person.age}"
    end
  end

  def ask_name_and_age
    print 'Age:'
    @age = gets.chomp.to_i
    print 'Name:'
    @name = gets.chomp
  end

  def create_person_option_one
    if @age < 18
      print 'Has parent permission? [Y/N]:'
      permission = gets.chomp
    end
    student = Student.new(@age, @name, parent_permission: permission)
    @people.push(student)

    print 'Student created successfully!'
  end

  def create_person
    puts "\nWould you like to create a student(1) or a teacher(2)?"
    option = gets.chomp.to_i
    ask_name_and_age

    if option == 1
      create_person_option_one
    elsif option == 2
      print 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(specialization, @age, @name)
      @people.push(teacher)

      print 'Teacher created successfully!'
    else
      print 'Invalid option.'
    end
  end

  def create_book
    print 'Author:'
    author = gets.chomp
    print 'Title:'
    title = gets.chomp
    print 'Book created successfully!'
    book = Book.new(title, author)
    @books.push(book)
  end

  def select_book
    if @books.length.positive?
      puts 'Please select the book from the list below by a number:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Title: \"#{book.title}\", Author: #{book.author}"
      end
      @book_choice = gets.chomp.to_i
    else
      puts 'No books added to the list'
      nil
    end
  end

  def select_person
    if @people.length.positive?
      puts 'Please select a person from the list below by a number (and not the id):'
      @people.each_with_index do |person, index|
        puts "#{index + 1}. [#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
      @person_choice = gets.chomp.to_i

    else
      puts 'No people added to the list'
    end
  end

  def create_rental
    select_person
    select_book
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp
    selected_person = @people[@person_choice - 1]
    selected_book = @books[@book_choice - 1]

    rental = selected_person.add_rental(date, selected_book)
    @rental.push(rental)
    puts 'Rental created successfully!'
  end

  def list_rentals_condition
    if person_rentals.empty?
      puts "No rentals found for person with ID #{id}"
    else
      puts 'Rentals:'
      person_rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
      end
    end
  end

  def list_rentals
    puts 'ID of a person:'
    id = gets.chomp.to_i
    person_rentals = @rental.select { |rental| rental.person.id == id }

    list_rentals_condition
  end
end
