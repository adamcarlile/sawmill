module Sawmill
  module Renderers
    class Text
      class Line
        using Sawmill::Refinements::Pluralizer

        def initialize(page)
          @page = page
        end

        def to_s
          [@page.path, @page.views, "visit".pluralize(@page.views)].join(' ')
        end

      end
    end
  end
end