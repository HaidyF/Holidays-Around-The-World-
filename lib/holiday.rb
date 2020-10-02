class Holiday
    attr_accessor :date, :localName, :name, :countryCode, :fixed, :global, :counties, :launchYear, :type
    @@all = []

    def initialize(countryCode)
        @countryCode = countryCode 
        @@all << self 
    end 

    def self.all
        @@all 
    end
end 