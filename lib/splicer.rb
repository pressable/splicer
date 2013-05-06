require 'splicer/version'
require 'splicer/errors'
require 'splicer/records'
require 'splicer/zone'
require 'splicer/provider'

# Splicer is a simple DNS data structure that allows you to publish changes to
# one or more dns services if desired.
#
# This was constructed with the need for a way to transition from one dns host
# to another and allow for a failover solution should your primary provider go
# down.
#
# Note: You will still have to manually point your name servers over to the new
# provider.
#
# == Available Providers
#
#   * splicer-dynect
#   * splicer-dns_made_easy
#
# == Example Configureation
#
#   Splicer.configure do |config|
#     config.add_provider Splicer::Dynect('company','user','password')
#     config.add_provider Splicer::DNSMadeEasy('user','password')
#   end
#
# @see Splicer::Provider for more information
#
# @author Matthew A. Johnston <warmwaffles@gmail.com>
module Splicer
  class << self
    # All of the available providers
    @@providers = {}

    # Configure Splicer
    def configure
      yield self
    end
  end

  # Add a DNS provider to your
  #
  # @raise [ArgumentError]
  # @param [Splicer::Provider] provider the provider you want to add
  # @return [Splicer::Provider]
  def self.register(provider)
    providers[provider.name] = provider
  end

  # Get a provider from the providers hash. If the provider is not found `nil`
  # will be returned
  #
  # @return [Splicer::Provider]
  def self.provider(name)
    providers[name]
  end

  def self.providers
    @@providers ||= {}
  end
end
