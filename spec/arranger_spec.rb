require_relative './spec_helper'

describe 'Arranger' do

    before(:example) {
        Arranger.class_variable_set(:@@all, [])
    }

    it 'when initialized, takes in a string and sets it to a name instance variable' do
        arranger = Arranger.new("Shaun Evans")

        expect(arranger.name).to eq("Shaun Evans")
        expect{Arranger.new}.to raise_error(ArgumentError)
    end

    context "Keeps a list of all the arranger's arrangements" do
        describe '#arrangements' do
            it 'initialized with an empty array for the arrangement list' do
                arranger = Arranger.new("SSL")

                expect(arranger.arrangements).to match_array([])
            end
            it "returns an array of all the arrangers' arrangement objects" do
                arranger = Arranger.new("Carnival")
                a1 = Arrangement.new
                a2 = Arrangement.new
                a3 = Arrangement.new

                arranger.arrangements << a1
                arranger.arrangements << a2
                arranger.arrangements << a3

                expect(arranger.arrangements).to match_array([a1, a2, a3])
            end
        end
        describe '#add_arrangement' do
            it 'takes in an arrangement object, and adds it to this arrangers arrangement list, if not already present' do
                a1 = Arrangement.new
                arranger = Arranger.new("Sammy Nestico")
                arranger.add_arrangement(a1)

                expect(arranger.arrangements).to include(a1)
            end
            it 'sets the arranger of the new arrangement to this arranger' do
                arrangement = Arrangement.new
                arranger = Arranger.new("Sammy Nestico")
                arranger.add_arrangement(arrangement)

                expect(arrangement.arranger).to eq(arranger)
            end
            it "does not allow duplicate entries on it's arrangement list" do
                a1 = Arrangement.new
                a2 = Arrangement.new
                arranger = Arranger.new("Eddie Lewis")
                arranger.add_arrangement(a1)
                arranger.add_arrangement(a2)
                arranger.add_arrangement(a1)

                expect(arranger.arrangements).to match_array([a1, a2])
            end
        end
    end
    
    context "Keeps a list of all arranger object in a class variable" do
        describe '.all' do
            it 'class has a class variable @@all initialized to an empty array' do
                expect(Arranger.all).to match_array([])
            end
            it 'returns a list of all arranger objects' do
                a1 = Arranger.new("Army")
                a2 = Arranger.new("Zinsmeister")
                a3 = Arranger.new("Bob Eber")

                expect(Arranger.all).to match_array([a1, a2, a3])
            end
        end
        describe '.select_or_create_by_name' do
            it 'takes in a string, finds and returns an existing arranger' do
                arranger = Arranger.new("Mark Scholl")
                
                expect(Arranger.select_or_create_by_name("Mark Scholl")).to eq(arranger)
            end
            it "takes in a string, creates and returns a new arranger object if one doesn't exist" do
                arranger = Arranger.select_or_create_by_name("Mark Scholl")
                expect(arranger).to be_a(Arranger)
                expect(arranger.name).to eq("Mark Scholl")
            end
        end
    end
end

        
        
