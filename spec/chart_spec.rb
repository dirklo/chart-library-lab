require_relative './spec_helper'

describe 'Chart' do
    it 'initialized with two arguments, filepath and instrument string' do
        expect{Chart.new}.to raise_error(ArgumentError)
    end

    context 'Can be assigned an arrangement object' do
        describe 'arrangement=' do
            it 'takes in an arrangement Object, and assigns it to this chart' do
                arrangement = Arrangement.new
                chart = Chart.new("./file/path.pdf", "insrtument")
                chart.arrangement = arrangement
                expect(chart.arrangement).to be_a(Arrangement)
            end
        end
    end
end