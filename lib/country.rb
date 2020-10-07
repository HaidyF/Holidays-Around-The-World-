class Country 
    attr_accessor :name, :country_code
    @@all = []

    def initialize(name:, country_code:)
        @name = name
        @country_code = country_code
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