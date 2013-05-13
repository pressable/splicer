module Splicer

  # The base Provider class. All providers **MUST** inherit from this class.
  # @author Matthew A. Johnston <warmwaffles@gmail.com>
  class Provider

    # Creates the zone in the DNS provider. If the zone exists, then nothing
    # will happen.
    #
    # @param [Splicer::Zone] zone
    def create_zone(zone)
      false
    end

    # Updates a zone in the DNS provider. This will take any current changes
    # that are made to the {Splicer::Zone} object and push them to the DNS. If
    # the zone does not exist, then nothing will be done.
    #
    # @param [Splicer::Zone] zone
    def update_zone(zone)
      false
    end

    # Rewrites a zone in the DNS provider. If the zone does not exist, then it
    # will be created. It will destroy all of the records in the DNS and rewrite
    # all of them.
    #
    # @param [Splicer::Zone] zone
    def rewrite_zone(zone)
      false
    end

    # Will simply delete the zone from the DNS provider.
    #
    # @param [Splicer::Zone] zone
    def delete_zone(zone)
      false
    end

    # Deletes a single record from a zone in the DNS provider.
    #
    # @param [Splicer::Records::Record] record
    # @param [Splicer::Zone] zone
    def delete_record_in_zone(record, zone)
      false
    end

    # Updates a single record in a zone.
    #
    # @param [Splicer::Records::Record] record
    # @param [Splicer::Zone] zone
    def update_record_in_zone(record, zone)
      false
    end

    # Creates a single record for a zone in the DNS provider. If the record
    # exists, then it will not do anything.
    #
    # @param [Splicer::Records::Record] record
    # @param [Splicer::Zone] zone
    def create_record_in_zone(record, zone)
      false
    end
  end

end
