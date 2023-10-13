require_relative 'app'

class Main < App
  def main
    puts "\nWelcome to School Library App!\n"
    present_user_options
  end

  def present_user_options
    puts "\nPlease choose an option by entering a number:\n" \
         "1. List all books\n" \
         "2. List all people\n" \
         "3. Create a person\n" \
         "4. Create a book\n" \
         "5. Create a rental\n" \
         "6. List all rentals to a given person id\n" \
         "7. Exit\n\n"
    @choice = gets.chomp.to_i
    options
  end

  def options
    case @choice
    when 1
      list_books
      present_user_options
    when 2
      list_people
      present_user_options
    when 3
      create_person
      present_user_options
    when 4
      create_book
      present_user_options
    when 5
      create_rental
      present_user_options
    when 6
      list_rentals
      present_user_options
    when 7
      puts 'Exiting the app! Goodbye'
      exit
    else
      puts 'Error: invalid number'
      present_user_options
    end
  end
end

Main.new.main
