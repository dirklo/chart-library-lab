class Artist
    attr_reader :name

    @@all = [] #lists all of the artists in the library

    def self.all
        @@all
    end

    def initialize(name) #initialized with an artist name and an empty array for artists songlist
        @name = name
        @songs = []
        self.class.all << self
    end
    
    def songs #has many songs
        @songs
    end

    def song_titles #prints all song titles
        @songs.map{|song| song.title}
    end

    def self.select_or_create_by_name(name) #returns Artist object found by name or creates a new one
        all.find{|artist| artist.name == name} || Artist.new(name)
    end

    def add_song(title) #creates a new song object, and sets this artist as the new song's artist
        song = Song.new(title)
        song.artist = self
    end
end
