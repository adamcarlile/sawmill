require 'uri'

module Sawmill
  module Attributes
    class Path < SimpleDelegator

      def initialize(path)
        super(URI.parse(path))
      end

    end
  end
end