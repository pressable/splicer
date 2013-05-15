module Splicer

  class Configuration
    attr_accessor :logger

    def initialize
      @configs = []
      @logger = NullObject.new
    end

    # @param [Object] config the configuration for a provider
    # @return [void]
    def register(config)
      @configs << config
    end

    # Returns a list of providers.
    # @return [Array] an array of providers
    def providers
      @configs.collect { |config| config.provider }
    end
  end

end
