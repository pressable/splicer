module Splicer
  module Records

    class NSRecord < Record
      attr_accessor :server

      # @param [String] name relative name
      # @param [String] server name server (fqdn)
      # @param [Integer] ttl TTL in seconds
      def initialize(name, server, ttl=300)
        super(name, ttl)
        @server = server
      end
    end

  end
end
