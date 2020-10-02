class API 

    def self.available_countries(country_name)
       url = "https://date.nager.at/Api/v2/AvailableCountries"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        countries = JSON.parse(response)
        #iterate - coutries.each do to create new country
        binding.pry
        Country.all.detect do |n| n.name == country_name
        output = countryCode
        end 
      
         
    end 

    def self.get_holiday(countryCode) 
        url= "https://date.nager.at/Api/v2/NextPublicHolidays/#{countryCode}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        holiday = JSON.parse(response)[0]
        output-name = holiday["name"]
        output-date = holiday["date"]
        puts (output-name) + " " + (output-date)
    end

end