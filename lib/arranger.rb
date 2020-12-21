class Arranger
    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name

    def initialize(name) #is initialized with a name
        @name = name
        @arrangements = []
        self.class.all << self
    end

    def arrangements #has many arrangements
        @arrangements
    end

    def add_arrangement(arrangement)
        raise AssociationTypeMismatchError, "#{arrangements.class} received, Arrangement expected." if !arrangement.is_a?(Arrangement)
        arrangements << arrangement if !arrangements.include?(arrangement)
        arrangement.arranger = self unless arrangement.arranger == self
    end

    def self.select_or_create_by_name(arranger_name)
        self.all.find{|a| a.name == arranger_name} || Arranger.new(arranger_name)
    end
end
