require_relative './spec_helper'

describe 'Arrangement' do
    it 'is initialized with a charts variable set to an empty string' do
        arrangement = Arrangement.new

        expect(arrangement.charts).to match_array([]) 
    end

    context 'can be assigned an arranger' do
        describe '#arranger' do
            it 'has an arranger' do
                arrangement = Arrangement.new
                arranger = Arranger.new("Shaun Evans")
                arrangement.arranger = arranger

                expect(arrangement.arranger.name).to eq("Shaun Evans")
            end
        end

        describe '#add_arranger' do
            it 'takes in a string, and finds an existing arranger object and assigns it to this arrangement' do
                arrangement = Arrangement.new
                arranger = Arranger.new("Sammy Nestico")
                arrangement.add_arranger("Sammy Nestico")

                expect(arrangement.arranger).to be_a(Arranger)
                expect(arrangement.arranger.name).to eq('Sammy Nestico')
            end
            it "takes in a string, and creates a new arranger object and assigns it to this arrrangement if it doesn't exist" do
                arrangement = Arrangement.new
                arrangement.add_arranger("Carnival")

                expect(arrangement.arranger).to be_a(Arranger)
            end
        end
    end

    context 'can be assigned a song' do
        it 'can access a variable to hold a song object' do
            arrangement = Arrangement.new
            song = Song.new("All Night Long")
            arrangement.song = song

            expect(arrangement.song).to be_a(Song)
        end
        it 'will only accept a song object' do
            arrangement = Arrangement.new
            song = "All Night Long"

            expect{arrangement.song = song}.to raise_error(AssociationTypeMismatchError)
        end
    end


    context "keeps a list of the arrangement's chart objects" do
        describe '#charts' do
            it "returns a list of the arrangement's charts" do
                arrangement = Arrangement.new
                c1 = Chart.new("./charts/song/sax.pdf", "tenor sax")
                c2 = Chart.new("./charts/song/trumpet.pdf", "trumpet")
                c3 = Chart.new("./charts/song/trombone.pdf", "trombone")
                arrangement.charts << c1
                arrangement.charts << c2
                arrangement.charts << c3

                expect(arrangement.charts).to match_array([c1, c2, c3])
            end
        end
        describe '#add_chart' do
            it "takes in two arguments, a filepath and instrument string, creates a new chart object and adds it to the arrangement's list of charts" do
                arrangement = Arrangement.new
                arrangement.add_chart("./charts/song/sax.pdf", "tenor sax")

                expect(arrangement.charts[0]).to be_a(Chart)
            end
        end
    end
end
