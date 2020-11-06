module Sawmill
  module Refinements
    module Pluralizer
      refine String do

        def pluralize(number)
          number == 1 ? self : self + 's'
        end

      end
    end
  end
end