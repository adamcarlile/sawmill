module Sawmill
  module Types
    include Dry.Types

    Path  = Types.Constructor(Attributes::Path)
    IP    = Types.Constructor(Attributes::IP)
  end
end