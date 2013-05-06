require 'splicer/version'
require 'splicer/errors'
require 'splicer/configuration'
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
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

end
