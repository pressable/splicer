require 'splicer/version'
require 'splicer/errors'
require 'splicer/null_object'
require 'splicer/configuration'
require 'splicer/records'
require 'splicer/provider'
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
#     config.register(Splicer::Dynect::Config.new('company','user','password'))
#     config.register(Splicer::DNSMadeEasy::Config.new('user','password'))
#     config.logger = Logger.new(STDOUT)
#   end
#
# @see Splicer::Provider for more information
#
# @author Matthew A. Johnston <warmwaffles@gmail.com>
module Splicer
  @@configuration = nil
  @@logger = nil

  # Configures the splicer library
  # @return [void]
  def self.configure &block
    @@configuration = Configuration.new
    yield(@@configuration)
    @@logger = @@configuration.logger
  end

  # Gets a list of providers
  # @return [Array<Splicer::Providers::Base>]
  def self.providers
    @@configuration ||= Configuration.new
    @@configuration.providers
  end

  # @return [void]
  def self.create_zone(zone)
    return false if zone_is_invalid(zone)
    providers.each do |provider|
      provider.create_zone(zone)
    end
  end

  # @return [void]
  def self.delete_zone(zone)
    return false if zone_is_invalid(zone)
    providers.each do |provider|
      provider.delete_zone(zone)
    end
  end

  # @return [void]
  def self.create_record_in_zone(record, zone)
    return false if arguments_are_invalid(record, zone)
    providers.each do |provider|
      provider.create_record_in_zone(record, zone)
    end
  end

  # @return [void]
  def self.update_record_in_zone(record, zone)
    return false if arguments_are_invalid(record, zone)
    providers.each do |provider|
      provider.update_record_in_zone(record, zone)
    end
  end

  # Fetches list of associated records
  # @return [] WE'LL FIGURE THIS OUT AS WE GO
  def self.get_records_for(zone)
    return false if zone_is_invalid(zone)
    providers.each do |provider|
      provider.get_records_for(zone)
    end
  end

  # Deletes a record from a zone
  # @return [void]
  def self.delete_record_in_zone(record, zone)
    return false if arguments_are_invalid(record, zone)
    providers.each do |provider|
      provider.delete_record_in_zone(record, zone)
    end
  end

  # The logger that splicer will use
  # @return [Logger|Splicer::NullObject]
  def self.logger
    @@logger || NullObject.new
  end

  def self.arguments_are_invalid(record, zone)
    !record.is_a?(Splicer::Records::Record) || zone_is_invalid(zone)
  end

  def zone_is_invalid(zone)
    !zone.is_a?(Splicer::Zone)
  end

end
