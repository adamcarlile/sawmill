module Sawmill
  class Visit < Dry::Struct
    attribute :ip, Types::IP

    def ==(other)
      other.class == self.class && other.ip == ip
    end
  end
end