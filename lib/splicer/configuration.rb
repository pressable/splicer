module Splicer

  class Configuration
    attr_reader :providers

    def initialize
      @providers = {}
    end

    # @param [Splicer::Provider] provider the dns provider
    # @return [Boolean]
    def register(provider)
      @providers[provider.name] = provider
      true
    rescue => error
      false
    end

    # @param [Symbol] name the name of the provider
    # @return [Splicer::Provider]
    def provider(name)
      @providers[name]
    end
  end

end
