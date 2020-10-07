# interacts with user 

class CLI
    def start
        puts ""
        puts "Welcome to Holidays Around The World!"
        puts ""
        puts "Search for upcoming holidays by entering a country name"
        puts ""
        API.available_countries
        @country = gets.strip.downcase
        puts ""
        a = Country.find(@country)
        until a!=nil
            puts "Country not available"
            puts ""
            puts "Please re-enter another country name or enter 'exit' to exit"
            @country = gets.strip.downcase
            a = Country.find(@country)
            puts ""
        end
        holidays = API.get_holiday(a)
        print_holidays(holidays)
        puts ""
        puts "Please enter listed number to get more information about the holiday or enter 'exit' to exit"
        puts ""
        details(holidays, input)
        while input != 'exit' do 
            input = gets.strip.downcase
            if input!= 'exit'
                input = input.to_i-1
            else
                break
            end
            if input <= (holidays.length - 1)
        details(holidays, input)
            else
                puts "invalid number"
            end
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

    def details(holidays, input)
        puts ""
        puts "Date = " + holidays[input]["date"]
        puts "Local Name = " + holidays[input]["localName"]
        puts "Name = " + holidays[input]["name"]
        puts "Type = " + holidays[input]["type"]
    end
end