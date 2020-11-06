module Sawmill
  module Renderers
    class Text

      def initialize(pages, text: 'visit')
        @pages = pages
        @text = text
      end

      def to_s
        lines.map(&:to_s).join("\n")
      end

      private

      def lines
        @lines ||= @pages.map {|x| Sawmill::Renderers::Text::Line.new(x, text: @text) }
      end

    end
  end
end