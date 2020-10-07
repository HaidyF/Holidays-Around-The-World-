class Holiday
    attr_accessor :date, :local_name, :name, :type, :country
    @@all = []

    def initialize(country:, date:, local_name:, name:, type:)
        @country = country
        @date = date
        @local_name = local_name
        @name = name
        @type = type
        @@all << self 
    end 

    def self.all
        @@all 
    end
end 