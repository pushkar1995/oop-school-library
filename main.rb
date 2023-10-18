require_relative 'app'
require_relative 'storingdata'
require_relative 'onloadingdata'

class Main
  def initialize
    @app = App.new
    @storing = StoringData.new(@app)
    @onloading = OnloadingData.new(@app)
  end

  def onloading_data
    @onloading.onloading_books_data
    @onloading.onloading_people_data
    @onloading.onloading_rentals_data
  end

  def saving_data
    @storing.save_books_to_json
    @storing.save_people_to_json
    @storing.save_rentals_to_json
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    puts "\nWelcome to School Library App!\n"
    onloading_data

    loop do
      print_user_options
      choice = gets.chomp.to_i

      case choice
      when 1 then @app.list_books
      when 2 then @app.list_people
      when 3 then @app.create_person
      when 4 then @app.create_book
      when 5 then @app.create_rental
      when 6 then @app.list_rentals
      when 7
        puts 'Exiting the app! Goodbye.'
        saving_data
        break
      else
        puts 'Error: Invalid number.'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def print_user_options
    puts "\nPlease choose an option by entering a number:\n" \
         "1. List all books\n" \
         "2. List all people\n" \
         "3. Create a person\n" \
         "4. Create a book\n" \
         "5. Create a rental\n" \
         "6. List all rentals to a given person id\n" \
         "7. Exit\n\n"
  end
end

Main.new.run
