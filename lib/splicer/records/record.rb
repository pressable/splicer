module Splicer
  module Records

    class Record
      attr_accessor :name, :ttl

      # @param [String] name the relative name
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, ttl)
        @name = name
        @ttl = ttl
      end
    end

  end
end
