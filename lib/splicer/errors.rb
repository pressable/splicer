module Splicer
  module Errors

    class Error < StandardError
    end

    class RequestError < Error
      attr_reader :data
      def initialize(message, data = {})
        super(message)
        @data = data
      end
    end

  end
end
