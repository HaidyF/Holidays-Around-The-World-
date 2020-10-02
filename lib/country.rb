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

   def self.find(user_input)
    @@all.detect do |n|
    n.name.downcase == user_input
    end 
    end
end 