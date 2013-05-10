module Splicer
  module Records

    class CNAMERecord < Record
      attr_accessor :cname

      # @param [String] name the relative name
      # @param [String] cname the alias (fqdn)
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, cname, ttl=300)
        super(name, ttl)
        @cname = cname
      end

      def type
        'CNAME'
      end
    end

  end
end
