module Sawmill
  class File
  
    def initialize(file, parser: Sawmill.config.default_parser)
      @file   = file.respond_to?(:each_entry) ? file : ::File.open(file)
      @parser = parser
      @store  = Hash.new {|h, k| h[k] = Sawmill::Page.new(path: k) }
    end

    def lines
      @lines ||= begin 
        enumerator { |path, ip| @store[path] << Sawmill::Visit.new(path: path, ip: ip) }
        @store.values
      end
    end

    private

    def enumerator
      @file.lazy.each_entry {|line| yield(*@parser.call(line)) }
    end
  
  end
end