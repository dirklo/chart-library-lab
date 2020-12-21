class Chart
    attr_accessor :filepath, :inst

    def initialize(filepath, inst)
        @file = filepath
        @inst = inst
    end

    attr_reader :arrangement #belongs to an arrangement

    def arrangement=(arrangement) #belongs to an arrangement
        @arrangement = arrangement unless @arrangement == arrangement
    end
end
