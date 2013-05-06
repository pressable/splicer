module Splicer
  module Records

    class SRVRecord < Record
      attr_accessor :target, :port, :priority, :weight

      # @param [String] name the relative name
      # @param [String] target the host name(fqdn)
      # @param [Integer] port the port number
      # @param [String] priority the priority
      # @param [Integer] weight the weight
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, target, port, priority=0, weight=0, ttl=300)
        super(name, ttl)
        @target = target
        @port = port
        @priority = priority
        @weight = weight
      end
    end

  end
end
