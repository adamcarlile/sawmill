module Sawmill
  class Page < Dry::Struct
    include Comparable
    extend Forwardable
    def_delegators :visits, :count, :<<

    attribute :path, Types::Path
    attribute :visits, Types::Array.default { [] }

    def <=>(other)
      views <=> other.views
    end
  end
end