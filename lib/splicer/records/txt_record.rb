module Splicer
  module Records

    class TXTRecord < Record
      attr_accessor :text

      # @param [String] name the relative name
      # @param [String] text the text
      # @param [Integer] ttl the TTL in seconds
      def initialize(name, text, ttl=300)
        super(name, ttl)
        @text = text
      end
    end

  end
end
