class Genre
    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name

    def initialize(name) #is initialized with a name and an empty array list of songs in this genre
        @name = name
        @songs = []
        self.class.all << self
    end

    def songs #has many songs
        @songs
    end

    def self.select_or_create_by_name(name) # takes in a string and returns an existing genre object or creates a new one
        all.find{|genre| genre.name == name} || Genre.new(name)
    end
end
