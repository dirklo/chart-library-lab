require_relative './spec_helper'

describe 'Song' do

    before(:example) {
        Song.class_variable_set(:@@all, [])
    }

    context 'Requires a title' do
        describe '#title' do
            it 'has a title' do 
                song = Song.new("All Along the Watchtower")
                expect(song.title).to eq("All Along the Watchtower")
            end
            it 'upon initialization, takes in 1 argument, a string, and sets it as the title' do
                expect{Song.new}.to raise_error(ArgumentError)
            end
        end
    end
    
    context 'Can associate to an artist' do
        describe '#artist' do
            it 'returns the artist object listed on the song' do
                song = Song.new("It Gets Funkier")
                song.artist = Artist.new("Vulfpect")
                
                expect(song.artist.class).to eq(Artist)
            end
        end

        describe '#artist=' do
            it 'assigns artist object to the song if an artist object is passed in' do
                song = Song.new("All Night Long")
                artist = Artist.new("Lionel Richie")
                song.artist = artist

                expect(song.artist.name).to eq("Lionel Richie")
            end
            it "finds and assigns an existing artist object to the song if a string is passed in" do
                song = Song.new("I Will Always Love You")
                artist = Artist.new("Whitney Houston")
                song.artist = "Whitney Houston"

                expect(song.artist.name).to eq("Whitney Houston")
            end
            it "creates and assigns a new artist object to the song if a string is passed in and the artist doesn't exist yet" do
                song = Song.new("Penny Lane")
                song.artist = "The Beatles"
                
                expect(song.artist.name).to eq("The Beatles")
            end
        end
    end

    context 'Keeps a unique list of genres' do 
        describe '#genres' do
            it 'song initializes with an empty array of genre tags' do
                song = Song.new("Funkytown")

                expect(song.genres).to match_array([])
            end
            it 'returns array of genre objects for the song' do
                song = Song.new("Sweet Caroline")
                g1 = Genre.new("rock")
                g2 = Genre.new("pop")
                g3 = Genre.new("sing-along")
                song.genres << g1
                song.genres << g2
                song.genres << g3
                
                expect(song.genres).to match_array([g1, g2, g3])
            end
        end

        describe '#add_genre' do
            it "adds a genre to the song's genre list if a genre object is passed in" do
                song = Song.new("I Pity The Fool")
                genre = Genre.new("blues")
                song.add_genre(genre)

                expect(song.genres).to match_array([genre])
            end
            it 'finds and adds a genre object to the list if a string is passed in' do
                song = Song.new("Get The Funk Outta My Face")
                genre = Genre.new("funk")
                song.add_genre("funk")

                expect(song.genres).to include(genre)
            end
            it "creates a new genre object and adds it to the songs genre list if a string is passed and the genre object doesn't already exist" do
                song = Song.new("Careless Whisper")
                song.add_genre("80's")

                expect(song.genres[0]).to be_a(Genre)
            end
        end
    end

    context 'Keeps a unique list of arrangements' do
        describe '#arrangements' do
            it 'song initializes with an empty array of arrangements' do
                song = Song.new("Our Lips Are Sealed")

                expect(song.arrangements).to match_array([])
            end
            it 'Returns array of all a songs arrangement objects' do
                song = Song.new("Sir Duke")
                a1 = Arrangement.new
                a2 = Arrangement.new
                a3 = Arrangement.new
                song.arrangements << a1
                song.arrangements << a2
                song.arrangements << a3

                expect(song.arrangements).to match_array([a1, a2, a3])
            end
        end

        describe '#create_arrangement' do
            it 'creates a new arrangement and adds it to this songs list of arrangements' do
                song = Song.new("You Can't Hurry Love")
                song.create_arrangement

                expect(song.arrangements.length).to eq(1)
            end 
            it 'adds this song as the song on the new arrangment' do
                song = Song.new("Get Down On It")
                song.create_arrangement

                expect(song.arrangements[0].song).to eq(song)
            end
        end
    end
    
    context 'Keeps a list of all song objects in a class valiable @@all' do
        it 'class has a @@all variable initialized to an empty array' do
            expect(Song.class_variable_get(:@@all)).to match_array([])
        end

        describe '.all' do
            it 'returns a list of all existing song objects' do
                song1 = Song.new("Always Be My Baby")
                song2 = Song.new("I Feel Good")
                song3 = Song.new("Endless Love")

                expect(Song.all).to match_array([song1, song2, song3])
            end
        end
    end
end