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

    # @param [Symbol] method the method by which you want to publish
    # @return [void]
    def publish(method)
      Splicer.providers.each do |provider|
        provider.publish(self, method)
      end
      true
    end
  end

end
