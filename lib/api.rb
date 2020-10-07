#handles API request
class API 

    def self.available_countries
        url = "https://date.nager.at/Api/v2/AvailableCountries"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        countries = JSON.parse(response)
        countries.each do |c|
        
            a = Country.new(country_code: c["key"], name: c["value"])
        end
    end 
    
    def self.get_holiday(country) 
        url= "https://date.nager.at/Api/v2/NextPublicHolidays/#{country.country_code}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        holidays = JSON.parse(response)
        holidays.each_with_index do |h, i|
            b = Holiday.new(date: h["date"], local_name: h["localName"], name: h["name"], country: country, type: h["types"])
        end
        holidays
    end

end