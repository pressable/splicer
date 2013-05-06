module Splicer
  module Records

    class AAAARecord < Record
      attr_accessor :ip

      # @param [String] name the relative name
      # @param [String] ip the IPv6 address
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, ip, ttl=300)
        super(name, ttl)
        @ip = ip
      end
    end

  end
end
