module Sawmill
  module Renderers
    class Text
      class Line
        using Sawmill::Refinements::Pluralizer

        def initialize(page, text: "visit")
          @page = page
          @text = text
        end

        def to_s
          [@page.path, @page.views, @text.pluralize(@page.views)].join(' ')
        end

      end
    end
  end
end