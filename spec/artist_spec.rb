require_relative './spec_helper'

describe 'Artist' do

    before(:example) {
        Artist.class_variable_set(:@@all, [])
    }

    it 'when initialized, takes in a string and sets it to a name instance variable' do
        artist = Artist.new("Stevie Wonder")
        expect(artist.name).to eq("Stevie Wonder")
    end
    

    context "Keeps a list of all an artist's songs" do
        it 'is initialized with an empty array for artists list of songs' do
            artist = Artist.new("Stevie Wonder")
            expect(artist.songs).to eq([])
        end

        describe '#songs' do
            it 'returns an array of this artists song objects' do

                artist = Artist.new("Stevie Wonder")
                song1 = Song.new("Living for the City")
                song1.artist = artist
                song2 = Song.new("Superstition")
                song2.artist = artist
                song3 = Song.new("Do I Do")
                song3.artist = artist

                expect(artist.songs).to match_array([song1, song2, song3])
            end 
        end

        describe '#print_song_titles' do
            it 'returns an array of the artists songs titles' do
                artist = Artist.new("Stevie Wonder")
                song1 = Song.new("Living for the City")
                song1.artist = artist
                song2 = Song.new("Superstition")
                song2.artist = artist
                song3 = Song.new("Do I Do")
                song3.artist = artist

                expect(artist.song_titles).to match_array(["Living for the City", "Superstition", "Do I Do"])
            end 
        end

        describe '#add_song' do
            it "Adds a new song object and adds it to this artist's song list" do
                artist = Artist.new("Bob James")
                artist.add_song("Ruby Ruby Ruby")

                expect(artist.songs[0]).to be_a(Song) 
            end
        end
    end
    
    context 'Class keeps a list of all Artists' do
        it 'adds the artist to a class variable @@all when initialized' do
            artist = Artist.new("Stevie Wonder")
            expect(Artist.all).to match_array([artist])
        end

        describe '.all' do
            it 'returns an array of all artist objects' do
                artist1 = Artist.new("Stevie Wonder")
                artist2 = Artist.new("Radiohead")
                artist3 = Artist.new("Teddy Pendegrass")

                expect(Artist.all).to match_array([artist1, artist2, artist3])
            end
        end

        describe '.select_or_create_by_name' do
            it 'returns Artist object matching the passed in name string, or creates a new one with the name String' do
                artist1 = Artist.new("Stevie Wonder")
                artist2 = Artist.new("Ratiohead")
                expect(Artist.select_or_create_by_name("Stevie Wonder")).to eq(artist1)
                    
                artist3 = Artist.select_or_create_by_name("Michael Jackson")
                expect(Artist.all).to include(artist3)
            end
        end
    end
end
