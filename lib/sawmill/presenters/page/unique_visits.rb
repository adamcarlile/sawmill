module Sawmill
  module Presenters
    module Page
      class UniqueVisits < SimpleDelegator
        def self.wrap(objects)
          objects.map {|x| new(x) }
        end

        def views
          visits.uniq.count
        end

      end
    end
  end
end