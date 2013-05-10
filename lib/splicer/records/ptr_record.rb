module Splicer
  module Records

    class PTRRecord < Record
      attr_accessor :host

      # @param [String] name the relative name
      # @param [String] host the host name (fqdn)
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, host, ttl=300)
        super(name, ttl)
        @host = host
      end

      def type
        'PTR'
      end
    end

  end
end
