class Country 
    attr_accessor :name, :countryCode
    @@all = []

    def initialize(name:, countryCode:)
        @name = name
        @countryCode = countryCode
        @@all << self
    end 

    def self.all
        @@all
    end

   def self.find(name)
    @@all.select { |n| n == name}
   end 
end 