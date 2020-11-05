require 'ipaddr'

module Sawmill
  module Attributes
    class IP < SimpleDelegator

      def initialize(address)
        super(address)
        # super(IPAddr.new(address)) # Turns out the entire dataset has bogus IP addresses
      end

    end
  end
end