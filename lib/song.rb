class Song
    @@all = []

    def self.all #returns list of all song objects
        @@all
    end

    attr_accessor :title
    attr_reader :artist

    def artist=(artist_name) #belongs to an artist
        @artist = Artist.select_or_create_by_name(artist_name) if artist_name.class == String
        @artist = artist_name if artist_name.class == Artist
        artist.songs << self
    end

    def initialize(title) #is initialized with a title, and empty arrays for arrangement and genres
        @title = title
        @genres = []
        @arrangements = []
        self.class.all << self
    end

    def genres #has many genres
        @genres
    end

    def add_genre(genre_name) #takes in either a genre object or string, locates or creates a new genre object, and assigns it to this song
        genre = Genre.select_or_create_by_name(genre_name) if genre_name.class == String
        genre = genre_name if genre_name.class == Genre
        genres << genre if !genres.include?(genre)
        genre.songs << self unless genre.songs.include?(self)
    end

    def arrangements #has many arrangements
        @arrangements
    end

    def create_arrangement #creates a new arrangement, adds it to this songs arrangement list, and sets this song as the arrangement's song 
        arrangement = Arrangement.new
        arrangement.song = self
        arrangements << arrangement unless arrangements.include?(self)
    end
end
