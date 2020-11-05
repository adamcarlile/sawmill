module Sawmill
  module Parsers
    class Tuple

      def self.call(line)
        line.split(' ')
      end

    end
  end
end
