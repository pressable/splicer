module Splicer
  module Records

    class ARecord < Record
      attr_accessor :ip

      # @param [String] name the relative name
      # @param [String] ip the IPv4
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, ip, ttl=300)
        super(name, ttl)
        @ip = ip
      end

      def type
        'A'
      end
    end

  end
end
