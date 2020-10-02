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
        if a==nil
            puts "Country not available"
            return []
        end
        holidays = API.get_holiday(a)
        print_holidays(holidays)
        puts ""
        puts "Please enter listed number to get more information about the holiday"
        puts ""
        input = gets.strip.downcase
        puts ""
        input = input.to_i-1
        puts "Date = " + holidays[input]["date"]
        puts "Local Name = " + holidays[input]["localName"]
        puts "Name = " + holidays[input]["name"]
        puts "Type = " + holidays[input]["type"]
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
end