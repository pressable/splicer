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
    return false if domain_information_is_invalid(record, zone)
    providers.each do |provider|
      provider.create_record_in_zone(record, zone)
    end
  end

  # @return [void]
  def self.update_record_in_zone(record, zone)
    return false if domain_information_is_invalid(record, zone)
    providers.each do |provider|
      provider.update_record_in_zone(record, zone)
    end
  end

  # @return [void]
  def self.get_zone_for(zone)
    return false if zone_is_invalid(zone)
    zone_array = providers.map { |provider| provider.get_zone_for(zone) }
    zone_array.compact.first
  end

  # Fetches list of associated records
  # @returns an array of Record objects
  def self.get_records_for(zone)
    return [] if zone_is_invalid(zone)
    providers.map { |provider| provider.get_records_for(zone) }.flatten
  end

  # Deletes a record from a zone
  # @return [void]
  def self.delete_record_in_zone(record, zone)
    return false if domain_information_is_invalid(record, zone)
    providers.each do |provider|
      provider.delete_record_in_zone(record, zone)
    end
  end

  # The logger that splicer will use
  # @return [Logger|Splicer::NullObject]
  def self.logger
    @@logger || NullObject.new
  end

  def self.domain_information_is_invalid(record, zone)
    !record.is_a?(Splicer::Records::Record) || zone_is_invalid(zone)
  end

  def self.zone_is_invalid(zone)
    !zone.is_a?(Splicer::Zone)
  end

end
