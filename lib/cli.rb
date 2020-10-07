# interacts with user 

class CLI
    def start
        puts ""
        puts "Welcome to Holidays Around The World!"
        puts ""
        puts "Search for upcoming holidays by entering a country name"
        puts ""
        API.available_countries
        country = gets.strip.downcase
        a = Country.find(country)
        until a!=nil
            puts "Country not available"
            puts ""
            puts "Please re-enter another country name or enter 'exit' to exit"
            country = gets.strip.downcase
            a = Country.find(country)
            puts ""
        end
        holidays = API.get_holiday(a)
        print_holidays(holidays)
        puts ""
        puts "Please enter listed number to get more information about the holiday or enter 'exit' to exit"
        puts ""
        input = gets.strip.downcase
        while input != 'exit' do 
            index = input.to_i-1
            if index <= (holidays.length - 1)
        details(holidays, index)
            else
                puts "invalid number"
            end
            puts ""
            puts "Select another holiday from the list above or enter 'exit' to exit"
            puts ""
            input = gets.strip.downcase
        end
        puts "Goodbye!!"
    end

    def print_holidays(holidays)
        puts ""
        puts "These are the upcoming holidays in your selected country."
        puts ""
        holidays.each_with_index do |h,i|
        puts " #{i+1}. #{h["name"]}"
        puts ""
        end
    end

    def details(holidays, index)
        puts ""
        puts "Date = " + holidays[index]["date"]
        puts "Local Name = " + holidays[index]["localName"]
        puts "Name = " + holidays[index]["name"]
        puts "Type = " + holidays[index]["type"]
    end
end