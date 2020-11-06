module Sawmill
  module Renderers
    class Text

      def initialize(pages)
        @pages = pages
      end

      def to_s
        lines.map(&:to_s).join("\n")
      end

      private

      def lines
        @lines ||= @pages.map {|x| Sawmill::Renderers::Text::Line.new(x) }
      end

    end
  end
end