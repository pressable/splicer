module Splicer

  class Zone
    attr_accessor :name, :ttl

    attr_reader :records

    # @param [String] name the name of the zone
    def initialize(name, ttl=3600)
      @name = name
      @ttl  = ttl
      @records = Array.new
    end

    # Adds a single record to this zone
    # @return [Boolean]
    def add_record(record)
      return false unless record.is_a?(Splicer::Records::Record)
      @records.push(record)
      true
    end

    # Adds a set of records to this zone
    # @return [Boolean]
    def add_records(records)
      records.each { |r| add_record(r) }
    end
  end

end
