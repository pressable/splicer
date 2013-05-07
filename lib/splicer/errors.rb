module Splicer
  module Errors

    class Error < StandardError
    end

    class NotImplemented < Error
    end

    class RequestError < Error
    end

  end
end
