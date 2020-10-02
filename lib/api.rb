#handles API request
class API 

    def self.available_countries
        url = "https://date.nager.at/Api/v2/AvailableCountries"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        countries = JSON.parse(response)
        countries.each do |c|
        
            a = Country.new(countryCode: c["key"], name: c["value"])
        end
    
    end 
    def self.get_holiday(country) 
        url= "https://date.nager.at/Api/v2/NextPublicHolidays/#{country.countryCode}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        holidays = JSON.parse(response)
        holidays.each_with_index do |h, i|
            b = Holiday.new(date: h["date"], localName: h["localName"], name: h["name"], countryCode: h["countryCode"], fixed: h["fixed"], global: h["global"], counties: h["counties"], launchYear: h["launchYear"], type: h["types"])
        end
        holidays
    end

end