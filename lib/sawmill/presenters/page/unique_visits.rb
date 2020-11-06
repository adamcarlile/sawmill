module Sawmill
  module Presenters
    module Page
      class UniqueVists < SimpleDelegator

        def views
          visits.uniq.count
        end

      end
    end
  end
end