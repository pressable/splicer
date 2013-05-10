module Splicer
  module Records

    class MXRecord < Record
      attr_accessor :exchanger, :priority

      # @param [String] name the relative name
      # @param [String] exchanger  the mail exchanger(fqdn)
      # @param [Integer] priority the priority
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, exchanger, priority=0, ttl=300)
        super(name, ttl)
        @exchanger = exchanger
        @priority = priority
      end

      def type
        'MX'
      end
    end

  end
end
