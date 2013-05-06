module Splicer

  class Zone
    attr_accessor :name

    attr_reader :records

    # @param [String] name the name of the zone
    def initialize(name)
      @name = name
      @records = Array.new
    end

    # Adds a single record to this zone
    # @return [void]
    def add_record(record)
      @records.push(record)
    end

    # Adds a set of records to this zone
    # @return [void]
    def add_records(records)
      @records.concat(records)
    end
  end

end
