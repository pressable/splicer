module Splicer

  class NullObject
    def initialize(*args)
      true
    end

    def method_missing(*args, &block)
      self
    end
  end

end
