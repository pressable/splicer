module Splicer

  class Provider
    def create_zone(zone)
      false
    end

    def delete_zone(zone)
      false
    end

    def delete_record_in_zone(record, zone)
      false
    end

    def update_record_in_zone(record, zone)
      false
    end

    def create_record_in_zone(record, zone)
      false
    end

    def get_records_for(record, zone)
      false
    end
  end

end
