module Sawmill
  class Parser
    DEFAULT_PARSER = :tuple
    PARSERS = {
      tuple: Sawmill::Parsers::Tuple
    }.freeze

    def self.default
      PARSERS[DEFAULT_PARSER]
    end
  end
end