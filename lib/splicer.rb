require 'splicer/version'
require 'splicer/errors'
require 'splicer/configuration'
require 'splicer/records'
require 'splicer/zone'

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
#   * splicer-no_op_provider
#
# == Example Configureation
#
#   Splicer.configure do |config|
#     config.register Splicer::Dynect::Config.new('company','user','password')
#     config.register Splicer::DNSMadeEasy::Config.new('user','password')
#   end
#
# @see Splicer::Provider for more information
#
# @author Matthew A. Johnston <warmwaffles@gmail.com>
module Splicer
  @@configuration = nil

  def self.configure &block
    @@configuration = Configuration.new
    yield(@@configuration)
  end

  def self.providers
    @@configuration ||= Configuration.new
    @@configuration.providers
  end

end
