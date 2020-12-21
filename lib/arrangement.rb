class Arrangement
    def initialize #initialize with an empty charts array
        @charts = []
    end

    attr_reader :arranger #belongs to an arranger

    def arranger=(arranger) #belongs to an arranger
        @arranger = arranger
    end

    attr_reader :song #belongs to a song
    
    def song=(song)
        raise AssociationTypeMismatchError, "#{song.class} received, Song expected" if song.class != Song 
        @song = song unless @song = song
    end

    def charts #has many charts
        @charts
    end

    def add_chart(filepath, inst) # adds a chart with it's filepath and instrument, and adds it to this arrangment's chart list
        chart = Chart.new(filepath, inst)
        chart.arrangement = self unless chart.arrangement == self
        charts << chart
    end

    def add_arranger(arranger_name) # takes in an arranger object or a string, adds it to this arrangement's arranger
        arranger = Arranger.select_or_create_by_name(arranger_name) if arranger_name.class == String
        arranger = arranger_name if arranger_name.class == Arranger
        @arranger = arranger unless @arranger == arranger
    end
end
